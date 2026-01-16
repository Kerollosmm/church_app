/// States for the Sync BLoC.
///
/// States:
/// - SyncInitial: Initial state before sync engine starts.
/// - SyncIdle: No pending sync operations.
/// - SyncInProgress: Actively syncing data to cloud.
/// - SyncCompleted: All pending operations synced successfully.
/// - SyncFailed: Sync failed, contains error details.
/// - SyncOffline: Device is offline, operations queued.
