import 'package:equatable/equatable.dart';

/// Represents a failure encountered during synchronization.
///
/// Purpose:
/// - Categorizes errors to determine retry strategies (transient vs permanent).
/// - Serializable for storage in the sync queue history.
class SyncFailure extends Equatable {
  final String code;
  final String message;
  final bool isTransient;
  final DateTime timestamp;

  const SyncFailure({
    required this.code,
    required this.message,
    this.isTransient = true,
    required this.timestamp,
  });

  /// Factory for network/connectivity errors.
  factory SyncFailure.network({String? message}) {
    return SyncFailure(
      code: 'NETWORK_ERROR',
      message: message ?? 'No internet connection available.',
      isTransient: true,
      timestamp: DateTime.now(),
    );
  }

  /// Factory for permission or auth errors.
  factory SyncFailure.accessDenied({String? message}) {
    return SyncFailure(
      code: 'ACCESS_DENIED',
      message: message ?? 'Permission denied. Please re-login.',
      isTransient: false,
      timestamp: DateTime.now(),
    );
  }

  /// Factory for validation errors (bad data).
  factory SyncFailure.validation({String? message}) {
    return SyncFailure(
      code: 'VALIDATION_ERROR',
      message: message ?? 'Invalid data format.',
      isTransient: false,
      timestamp: DateTime.now(),
    );
  }

  /// Factory for business logic conflicts.
  factory SyncFailure.conflict({String? message}) {
    return SyncFailure(
      code: 'CONFLICT',
      message: message ?? 'Data conflict detected.',
      isTransient: false,
      timestamp: DateTime.now(),
    );
  }

  factory SyncFailure.unknown({dynamic originalError}) {
    return SyncFailure(
      code: 'UNKNOWN',
      message: originalError?.toString() ?? 'An unknown error occurred.',
      isTransient: true,
      timestamp: DateTime.now(),
    );
  }

  @override
  List<Object?> get props => [code, message, isTransient, timestamp];

  // Helper for serialization (if needed for Hive)
  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'message': message,
      'isTransient': isTransient,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  factory SyncFailure.fromMap(Map<String, dynamic> map) {
    return SyncFailure(
      code: map['code'] as String,
      message: map['message'] as String,
      isTransient: map['isTransient'] as bool,
      timestamp: DateTime.parse(map['timestamp'] as String),
    );
  }
}
