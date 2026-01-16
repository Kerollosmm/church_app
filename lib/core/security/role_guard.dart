/// Route-level RBAC enforcement guard.
///
/// Responsibilities:
/// - Check if current user has required role for the route.
/// - Redirect to unauthorized page if role check fails.
/// - Used by both servant and admin routers.
///
/// Usage:
/// - Apply to routes that require specific roles.
/// - Works with RolePolicy to determine permissions.
