/// Offline sync engine.
///
/// Purpose:
/// - Listen to connectivity changes
/// - Flush queued commands to Firestore when online
/// - Apply conflict policy and retry strategy
///
/// This keeps offline logic centralized and prevents duplication inside repositories.
class SyncService {}
