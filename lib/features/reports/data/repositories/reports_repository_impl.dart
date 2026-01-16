/// Repository implementation (data layer).
///
/// Purpose:
/// - Implements the domain repository using datasources (Firestore + local cache + sync queue)
/// - Contains the offline-first decision: online => write remote, offline => queue + cache
