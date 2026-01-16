/// BLoC managing Authentication State.
///
/// Responsibilities:
/// - Handle LoginRequested event.
/// - Handle LogoutRequested event.
/// - Handle CheckAuthStatus event.
/// - Emit states: AuthInitial, AuthLoading, Authenticated, Unauthenticated, AuthError.
/// - Coordinate with auth repository for authentication operations.
