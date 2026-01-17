/// Route guard to enforce Role-Based Access Control (RBAC).
///
/// Responsibilities:
/// - Intercept navigation to restricted routes.
/// - Verify user role (Admin, Servant, etc.).
/// - Redirect unauthorized users to appropriate page.
/// - Used by admin routes to restrict access.
