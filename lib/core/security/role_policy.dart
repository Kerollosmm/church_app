/// Role-to-permissions mapping policy.
///
/// Responsibilities:
/// - Define what each role (servant, admin, student) can access.
/// - Provide permission checking utilities.
/// - Centralize RBAC logic for consistent access control.
///
/// Roles:
/// - servant: Can mark attendance, view assigned students.
/// - admin: Full access to conflicts, reports, user management.
/// - student: View own attendance records (future).
