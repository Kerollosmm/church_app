/// Defines canonical field names for exact matching in Firestore queries and Rules.
///
/// Purpose:
/// - Prevents typos in string literals.
/// - Serves as the source of truth for database schema field keys.
class FirestoreFieldNames {
  // Common
  static const String id = 'id';
  static const String createdAt = 'created_at';
  static const String updatedAt = 'updated_at';
  static const String createdBy = 'created_by';
  static const String isActive = 'is_active';

  // User / Profile
  static const String uid = 'uid';
  static const String email = 'email';
  static const String displayName = 'display_name';
  static const String role = 'role';
  static const String assignedGrades = 'assigned_grades';

  // Student
  static const String studentId = 'student_id';
  static const String firstName = 'first_name';
  static const String lastName = 'last_name';
  static const String grade = 'grade';
  static const String group = 'group';

  // Attendance
  static const String sessionId = 'session_id';
  static const String date = 'date';
  static const String status = 'status'; // present, absent, etc
  static const String note = 'note';

  // Sync & Conflict
  static const String syncState = 'sync_state';
  static const String lastSyncAttempt = 'last_sync_attempt';
  static const String conflictResolved = 'conflict_resolved';
}
