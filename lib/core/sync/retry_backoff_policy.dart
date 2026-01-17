/// Strategy for retrying failed sync operations.
///
/// Responsibilities:
/// - Define exponential backoff intervals with jitter.
/// - Calculate delay before next retry attempt.
/// - Determine when to stop retrying (maximum retry count).
/// - Provide default policy configuration.
