/// Events for the Sync BLoC.
///
/// Events:
/// - StartSync: Begin syncing pending operations.
/// - StopSync: Pause sync engine (e.g., app backgrounded).
/// - RetryFailedSync: Retry previously failed operations.
/// - ConnectivityChanged: Network status changed.
/// - SyncOperationCompleted: Single operation finished.
/// - SyncOperationFailed: Single operation failed.
