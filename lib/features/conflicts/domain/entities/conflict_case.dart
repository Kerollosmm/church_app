/// Domain entity representing a data conflict requiring resolution.
///
/// A conflict occurs when two servants submit different attendance
/// statuses for the same student in the same session.
///
/// Fields:
/// - id: Unique conflict case identifier.
/// - sessionId: The attendance session where conflict occurred.
/// - studentId: The student with conflicting records.
/// - versions: List of conflicting attendance versions.
///   Each version contains: recordId, status, submitterId, submittedAt.
/// - status: Current conflict status (PENDING_REVIEW, RESOLVED).
/// - detectedAt: When the conflict was detected.
/// - resolvedAt: When admin resolved the conflict (nullable).
/// - resolvedBy: Admin user ID who resolved (nullable).
/// - chosenVersionId: The record ID that was chosen as correct (nullable).
///
/// Responsibilities:
/// - Represent the conflict state without knowledge of data source.
/// - Provide access to both conflicting versions for comparison.
