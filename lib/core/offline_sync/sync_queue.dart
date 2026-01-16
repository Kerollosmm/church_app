import 'sync_command.dart';
import 'sync_failure.dart';

/// Interface for the offline sync queue.
///
/// Purpose:
/// - Abstract the persistent storage of commanded operations.
/// - Ensure FIFO (First-In-First-Out) ordering for strict consistency.
abstract class SyncQueue {
  /// Adds a command to the end of the queue.
  Future<void> enqueue(SyncCommand command);

  /// Retrieves the next batch of pending commands.
  /// Ignores commands currently marked as 'in-flight'.
  Future<List<SyncCommand>> pending({int limit = 10});

  /// Marks a specific command as being processed (prevents double processing).
  Future<void> markInFlight(String id);

  /// Successfully completes a command, removing it from the queue.
  Future<void> markDone(String id);

  /// Updates a command with failure details and releases 'in-flight' status.
  Future<void> markFailed(String id, SyncFailure failure);

  /// Clears all commands (used primarily for testing or full resets).
  Future<void> clear();
}

/// Stub implementation using Hive.
///
/// TODO: Register a strict TypeAdapter for SyncCommand before using.
class HiveSyncQueue implements SyncQueue {
  // ignore: unused_field
  final String _boxName = 'sync_queue_v1';

  // TODO: Inject Hive Box instance or open lazily
  // Box<SyncCommand> get _box => Hive.box<SyncCommand>(_boxName);

  @override
  Future<void> enqueue(SyncCommand command) async {
    // TODO: Implement put to Hive
    // await _box.put(command.id, command);
  }

  @override
  Future<List<SyncCommand>> pending({int limit = 10}) async {
    // TODO: Implement query from Hive
    // return _box.values.where((c) => ...).take(limit).toList();
    return [];
  }

  @override
  Future<void> markInFlight(String id) async {
    // TODO: Metadata update in Hive
  }

  @override
  Future<void> markDone(String id) async {
    // TODO: Delete from Hive
    // await _box.delete(id);
  }

  @override
  Future<void> markFailed(String id, SyncFailure failure) async {
    // TODO: Update command with retries++ and failure info
  }

  @override
  Future<void> clear() async {
    // TODO: Clear box
  }
}
