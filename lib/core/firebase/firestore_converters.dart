import 'package:cloud_firestore/cloud_firestore.dart';

/// Helpers for verifying and converting Firestore data types.
///
/// Purpose:
/// - Provides consistent Timestamp <-> DateTime conversions.
/// - Ensures null safety during data mapping.
class FirestoreConverters {
  /// Converts a Firestore [Timestamp] to a Dart [DateTime].
  /// Returns [fallback] or local now if null.
  static DateTime timestampToDateTime(dynamic value, {DateTime? fallback}) {
    if (value is Timestamp) {
      return value.toDate();
    }
    if (value is String) {
      return DateTime.tryParse(value) ?? (fallback ?? DateTime.now());
    }
    return fallback ?? DateTime.now();
  }

  /// Converts a Dart [DateTime] to a Firestore [Timestamp].
  static Timestamp dateTimeToTimestamp(DateTime date) {
    return Timestamp.fromDate(date);
  }

  /// Converts a Firestore Map to a strictly typed Map (handling nulls).
  static Map<String, dynamic> idFromWithSnapshot(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data();
    if (data == null) return {};
    data['id'] = snapshot.id; // Inject ID into the map
    return data;
  }
}
