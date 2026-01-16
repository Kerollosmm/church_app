/// Defines the synchronization state of a data entity.
///
/// Purpose:
/// - Provides explicit visibility into the data lifecycle (Local -> Cloud).
/// - Maps technical states to user-friendly messages.
enum SyncState {
  /// Data is saved securely on the device but has not yet been processed by the sync engine.
  savedToDevice,

  /// Data is currently being uploaded to the cloud.
  syncing,

  /// Data has been confirmed as persisted in the cloud.
  syncedToCloud,

  /// Sync failed due to a transient error (network, server 500).
  /// Action Recommendation: Retry allowed.
  failed,

  /// Sync failed due to a business logic conflict (e.g., concurrent edits).
  /// Action Recommendation: Manual review required. No automatic overwrite.
  conflictReview;

  /// Returns a user-facing label for the status.
  String get userLabel {
    switch (this) {
      case SyncState.savedToDevice:
        return 'Saved to device';
      case SyncState.syncing:
        return 'Syncing...';
      case SyncState.syncedToCloud:
        return 'Synced';
      case SyncState.failed:
        return 'Sync Failed – Action Required';
      case SyncState.conflictReview:
        return 'Conflict Detected – Review Required';
    }
  }

  /// Returns true if the state implies the data is safe locally but not yet on server.
  bool get isPending =>
      this == SyncState.savedToDevice || this == SyncState.failed;
}
