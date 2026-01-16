/// Retry backoff policy for failed sync operations.
///
/// Responsibilities:
/// - Calculate delay before next retry attempt.
/// - Implement exponential backoff with jitter.
/// - Define maximum retry count.
/// - Provide default policy configuration.
