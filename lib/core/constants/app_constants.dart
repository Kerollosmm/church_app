// app_constants.dart
//
// PURPOSE:
// Holds application-wide constant values to avoid magic strings and magic numbers.
// This includes Firebase collection names, storage keys, and other configuration constants.
//
// USAGE:
// Import this file and use the static constants.
// Example: `FirebaseFirestore.instance.collection(AppConstants.usersCollection)`

class AppConstants {
  // Firebase Collections
  static const String servantsCollection = 'servants';
  static const String attendanceCollection = 'attendance';
  static const String auditLogsCollection = 'audit_logs';

  // Hive Boxes
  static const String authBox = 'auth_box';
  static const String servantsBox = 'servants_box';
  static const String attendanceBox = 'attendance_box';

  // Secure Storage Keys
  static const String authTokenKey = 'auth_token';
}
