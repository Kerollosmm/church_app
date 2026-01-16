/// Use case to fetch notifications for the current user.
///
/// Responsibilities:
/// - Call notification repository.
/// - Filter by user role (admin gets conflict alerts, servants get sync status).
/// - Return sorted list by priority and timestamp.
