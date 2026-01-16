/// Model representing a sync command to be processed.
///
/// Responsibilities:
/// - Contain all data needed to sync an entity.
/// - Track retry count and last attempt time.
/// - Store command type (CREATE, UPDATE, DELETE).
/// - Serializable for Hive persistence.
