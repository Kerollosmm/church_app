/// Entry point for the Admin Web Portal.
///
/// Responsibilities:
/// - Initialize the admin-specific bootstrap process.
/// - Call bootstrapAdmin() for DI and real-time listeners.
/// - Run the AdminApp widget.
///
/// Separation from main_servant.dart enables:
/// - Different routing (admin-specific screens).
/// - Different DI configurations (real-time streaming for web).
/// - Admin-only features not loaded in mobile app.
