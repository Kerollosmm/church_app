/// Abstract interface for the sync queue.
///
/// Responsibilities:
/// - Store pending sync operations.
/// - Retrieve operations in FIFO order.
/// - Persist queue across app restarts (Hive).
/// - Track retry count for failed operations.
