/// States for the Auth BLoC.
///
/// States:
/// - AuthInitial: Initial state before any auth check.
/// - AuthLoading: Authentication operation in progress.
/// - Authenticated: User is logged in (contains UserEntity).
/// - Unauthenticated: User is not logged in.
/// - AuthError: Authentication error occurred (contains error message).
