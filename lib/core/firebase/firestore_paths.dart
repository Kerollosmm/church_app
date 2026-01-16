/// Centralizes all Firestore path construction.
///
/// Purpose:
/// - Eliminates magic strings for collection/doc paths.
/// - Ensures consistency across all repositories and Cloud Functions.
class FirestorePaths {
  // Root Collections
  static const String users = 'users';
  static const String students = 'students';
  static const String attendanceSessions = 'attendance_sessions';
  static const String conflicts = 'conflicts';

  // Sub-collections logic can be added here if needed.
  // Example: static String studentAttendance(String studentId) => 'students/$studentId/attendance';

  // Document Helpers
  static String userDoc(String uid) => '$users/$uid';
  static String studentDoc(String studentId) => '$students/$studentId';
  static String sessionDoc(String sessionId) =>
      '$attendanceSessions/$sessionId';

  // Attendance Records usually are a subcollection of a Session, or a top-level collection
  // queried by filters. Assuming top-level for scalability as per specifications imply.
  static const String attendanceRecords = 'attendance_records';
  static String attendanceRecordDoc(String recordId) =>
      '$attendanceRecords/$recordId';
}
