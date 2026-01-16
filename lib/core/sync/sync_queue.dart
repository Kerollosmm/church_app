/// Management class for the synchronization queue.
///
/// Responsibilities:
/// - Persist offline actions (creates/updates/deletes) to a local queue.
/// - Execute queue items when network is available.
/// - Handle retry logic.
