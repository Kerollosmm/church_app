/// Use case to fetch all pending conflict cases for admin review.
///
/// Responsibilities:
/// - Call conflict repository to get unresolved conflicts.
/// - Return list of ConflictCase entities.
/// - Filter by status: PENDING_REVIEW.
