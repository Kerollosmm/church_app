/// Sync Registry.
///
/// LISTS which repositories must be synced by the Sync Engine.
/// This prevents the SyncEngine from knowing about specific feature implementations directly.
/// usage:
/// final syncManifest = [
///   FeatureARepository(),
///   FeatureBRepository(),
/// ];
class SyncManifest {
  // TODO: Register repositories implementing ISyncRepository
  static final List<dynamic> repositories = [];
}
