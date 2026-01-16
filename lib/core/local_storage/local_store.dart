/// Local key-value / document store abstraction.
///
/// Purpose:
/// - Provide a single interface for local persistence (Hive OR SQLite)
/// - Used by caches and the sync queue
///
/// Choose one implementation in DI to avoid duplicated storage systems.
abstract class LocalStore {}
