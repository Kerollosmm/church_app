/// Reusable widget to display sync status indicator.
///
/// Responsibilities:
/// - Display "Saved to Device" (local icon, orange).
/// - Display "Syncing..." (animated, blue).
/// - Display "Synced to Cloud" (cloud icon, green).
/// - Display "Sync Failed - Action Required" (error icon, red).
/// - Display "Conflict - Review Required" (warning icon, amber).
///
/// Usage:
/// SyncIndicator(status: SyncStatus.savedToDevice)
