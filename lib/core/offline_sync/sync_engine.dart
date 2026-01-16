import 'dart:async';
import 'dart:math';

import 'conflict_policy.dart';
import 'sync_command.dart';
import 'sync_failure.dart';
import 'sync_queue.dart';

/// Orchestrates the synchronization process.
///
/// Purpose:
/// - Processes the SyncQueue.
/// - Handles retries using exponential backoff.
/// - Delegates specific write logic to a provided executor (abstracted from Firebase).
class SyncEngine {
  final SyncQueue _queue;
  final ConflictPolicy _conflictPolicy;
  final Future<void> Function(SyncCommand) _remoteExecutor;

  // Simple exponential backoff: 2s, 4s, 8s, 16s...
  static const int _maxRetries = 5;

  SyncEngine({
    required SyncQueue queue,
    required ConflictPolicy conflictPolicy,
    required Future<void> Function(SyncCommand) remoteExecutor,
  }) : _queue = queue,
       _conflictPolicy = conflictPolicy,
       _remoteExecutor = remoteExecutor;

  /// Triggers a flush of the pending queue.
  /// Should be called on internet connectivity restoration.
  Future<void> flush() async {
    final pendingCommands = await _queue.pending();

    if (pendingCommands.isEmpty) return;

    for (final cmd in pendingCommands) {
      if (cmd.attempts >= _maxRetries) {
        // Stop processing if max retries reached to avoid blocking forever.
        // In a real app, this might move to a "Dead Letter Queue".
        continue;
      }

      await _processCommand(cmd);
    }
  }

  Future<void> _processCommand(SyncCommand cmd) async {
    await _queue.markInFlight(cmd.id);

    try {
      // Execute the actual network call
      await _remoteExecutor(cmd);

      // Success
      await _queue.markDone(cmd.id);
    } catch (e) {
      // Map error to SyncFailure
      final failure = _mapErrorToFailure(e);

      // Handle specific policies
      if (!failure.isTransient) {
        // Terminal error (validation/permission) -> Mark failed immediately
        await _queue.markFailed(cmd.id, failure);
      } else {
        // Transient error -> Retry logic
        await _queue.markFailed(cmd.id, failure);
        _scheduleRetry(cmd.attempts + 1);
      }
    }
  }

  SyncFailure _mapErrorToFailure(dynamic error) {
    // This would typically introspect FirebaseExceptions
    if (error.toString().contains('permission-denied')) {
      return SyncFailure.accessDenied();
    }
    return SyncFailure.network(message: error.toString());
  }

  void _scheduleRetry(int attempt) {
    final delay = Duration(seconds: pow(2, attempt).toInt());
    // In a real implementation, this would schedule a background job.
    // For now, we rely on the next 'flush' trigger.
    print('Scheduled retry in $delay');
  }
}
