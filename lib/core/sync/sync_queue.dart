/// Management class for the synchronization queue.
///
/// Responsibilities:
/// - Persist offline actions (creates/updates/deletes) to a local queue (Hive).
/// - Execute queue items when network is available (FIFO order).
/// - Handle retry logic and track retry counts.
/// - Retrieve operations.
