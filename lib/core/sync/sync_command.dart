<<<<<<< HEAD
/// Represents a unified operation to be synced to the backend.
///
/// Purpose:
/// - Encapsulates all necessary data to replay a user action.
/// - Supports idempotency to prevent duplicate processing.
=======
/// Model representing a sync command to be processed.
///
/// Responsibilities:
/// - Contain all data needed to sync an entity.
/// - Track retry count and last attempt time.
/// - Store command type (CREATE, UPDATE, DELETE).
/// - Serializable for Hive persistence.
>>>>>>> structure-fix-plan
