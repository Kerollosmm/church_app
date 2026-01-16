/**
 * Cloud Function: notifyAdminOnConflict
 *
 * Triggered when a conflict_case document is created.
 *
 * Responsibilities:
 * - Send FCM push notification to all admin users.
 * - Create in-app notification document for each admin.
 * - Log the notification for audit trail.
 */
