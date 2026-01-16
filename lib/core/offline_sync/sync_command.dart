import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

import 'sync_failure.dart';

/// Represents a unified operation to be synced to the backend.
///
/// Purpose:
/// - Encapsulates all necessary data to replay a user action.
/// - Supports idempotency to prevent duplicate processing.
class SyncCommand extends Equatable {
  /// Unique ID for the command in the queue.
  final String id;

  /// The type of operation (e.g., 'create', 'update', 'delete').
  final String type;

  /// The target collection path (e.g., 'attendance_records').
  final String collection;

  /// The data payload associated with the command.
  final Map<String, dynamic> payload;

  /// When the user action actually occurred.
  final DateTime createdAt;

  /// Key ensuring the server processes this command exactly once.
  final String idempotencyKey;

  /// Number of times this command has been attempted.
  final int attempts;

  /// The last error encountered, if any.
  final SyncFailure? lastError;

  const SyncCommand({
    required this.id,
    required this.type,
    required this.collection,
    required this.payload,
    required this.createdAt,
    required this.idempotencyKey,
    this.attempts = 0,
    this.lastError,
  });

  /// Factory to create a fresh command.
  factory SyncCommand.create({
    required String type,
    required String collection,
    required Map<String, dynamic> payload,
  }) {
    return SyncCommand(
      id: const Uuid().v4(),
      type: type,
      collection: collection,
      payload: payload,
      createdAt: DateTime.now(),
      idempotencyKey: const Uuid().v4(),
    );
  }

  /// Creates a copy with updated status for retry logic.
  SyncCommand copyWith({int? attempts, SyncFailure? lastError}) {
    return SyncCommand(
      id: id,
      type: type,
      collection: collection,
      payload: payload,
      createdAt: createdAt,
      idempotencyKey: idempotencyKey,
      attempts: attempts ?? this.attempts,
      lastError: lastError ?? this.lastError,
    );
  }

  @override
  List<Object?> get props => [
    id,
    type,
    collection,
    payload,
    createdAt,
    idempotencyKey,
    attempts,
    lastError,
  ];
}
