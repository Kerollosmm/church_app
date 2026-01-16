/// Route guard to enforce Role-Based Access Control (RBAC).
///
/// Responsibilities:
/// - Intercept navigation to admin-only routes.
/// - Verify user role (Admin, Servant, etc.).
/// - Redirect unauthorized users.
