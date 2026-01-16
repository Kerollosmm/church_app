import 'sync_state.dart';

/// Defines the policy for handling server-side data conflicts.
///
/// Purpose:
/// - Enforce the "No Automatic Overwrite" rule.
/// - Structure conflict cases for administrative review.
class ConflictPolicy {
  /// Determines if a conflict exists between local and remote data.
  ///
  /// Returns `true` if the server state differs meaningfully from the local intention.
  bool isConflict({
    required Map<String, dynamic> localPayload,
    required Map<String, dynamic> serverData,
  }) {
    // Minimal implementation: if basic status fields differ, it's a conflict.
    // Specialize this logic per feature if needed.
    final localStatus = localPayload['status'];
    final serverStatus = serverData['status'];

    if (localStatus != null &&
        serverStatus != null &&
        localStatus != serverStatus) {
      return true;
    }
    return false;
  }

  /// Generates a Conflict Resolution Case.
  ///
  /// This object would typically be stored in a 'conflicts' collection.
  Map<String, dynamic> generateConflictCase({
    required String docId,
    required String collection,
    required Map<String, dynamic> localPayload,
    required Map<String, dynamic> serverData,
  }) {
    return {
      'docId': docId,
      'collection': collection,
      'localValue': localPayload,
      'serverValue': serverData,
      'detectedAt': DateTime.now().toIso8601String(),
      'status': 'open', // open, resolved
      'resolution': null,
    };
  }

  /// Returns the safe fallback state when a conflict is detected.
  SyncState get fallbackState => SyncState.conflictReview;
}
