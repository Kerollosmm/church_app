/// Application bootstrap pipeline.
///
/// Purpose:
/// - Initialize Firebase
/// - Initialize dependency injection (DI)
/// - Initialize local storage (Hive/SQLite)
/// - Start background sync engine (offline queue flushing)
///
/// Keep startup logic here so `main.dart` stays tiny.

