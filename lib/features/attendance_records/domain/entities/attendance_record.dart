/// Domain entity representing an attendance record.
///
/// A record represents the attendance status of a single student in a specific session.
///
/// Fields:
/// - id: Unique record identifier.
/// - sessionId: Reference to the session.
/// - studentId: Reference to the student.
/// - status: Attendance status (present, absent, late, excused).
/// - submitterId: ID of servant who marked this.
/// - submittedAt: Timestamp of submission.
/// - syncStatus: Current sync state (saved, syncing, synced, conflict).
/// - conflictId: Reference to conflict case if in conflict.
