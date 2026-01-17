<<<<<<< HEAD
/// Management class for the synchronization queue.
///
/// Responsibilities:
/// - Persist offline actions (creates/updates/deletes) to a local queue.
/// - Execute queue items when network is available.
/// - Handle retry logic.
=======
/// Abstract interface for the sync queue.
///
/// Responsibilities:
/// - Store pending sync operations.
/// - Retrieve operations in FIFO order.
/// - Persist queue across app restarts (Hive).
/// - Track retry count for failed operations.
>>>>>>> structure-fix-plan
