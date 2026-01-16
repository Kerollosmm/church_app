/// BLoC for managing global sync state.
///
/// Responsibilities:
/// - Handle StartSync event when app comes online.
/// - Handle StopSync event when app goes to background.
/// - Handle RetryFailedSync event for manual retry.
/// - Emit sync progress and status to UI.
/// - Coordinate with SyncEngine for actual sync operations.
