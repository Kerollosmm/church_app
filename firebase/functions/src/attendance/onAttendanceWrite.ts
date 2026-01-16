/**
 * Cloud Function: onAttendanceWrite
 *
 * Triggered when an attendance record is created or updated.
 *
 * Responsibilities:
 * - Detect conflicting attendance records for the same (sessionId, studentId).
 * - If conflict detected, create a conflict_case document.
 * - Mark both attendance records as CONFLICT_DETECTED.
 * - Trigger admin notification.
 *
 * Conflict Detection Logic:
 * - Query for existing records with same sessionId + studentId.
 * - If record exists with different submitterId and different status, flag as conflict.
 * - Do NOT overwrite previous record; create conflict case for admin resolution.
 */
