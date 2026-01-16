/// Enum representing the synchronization status of an entity.
///
/// This enum is used throughout the app to indicate whether data
/// has been saved locally, is syncing, or has been synced to the cloud.
///
/// Values:
/// - savedToDevice: Data saved locally, pending cloud sync.
/// - syncing: Currently uploading to Firebase.
/// - syncedToCloud: Successfully synced to Firebase.
/// - syncFailed: Failed to sync, user action required.
/// - conflictDetected: Conflict detected, admin review required.
