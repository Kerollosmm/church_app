/// Entry point for the Servant Mobile App.
///
/// Responsibilities:
/// - Initialize the servant-specific bootstrap process.
/// - Call bootstrapServant() for DI and Hive setup.
/// - Run the ServantApp widget.
///
/// Separation from main_admin.dart enables:
/// - Tree-shaking of admin-only code from mobile bundle.
/// - Different DI configurations (offline-first for mobile).
/// - Smaller binary size for mobile distribution.
