// network_info.dart
//
// PURPOSE:
// Abstraction for checking internet connectivity.
//
// USAGE:
// Used by Repositories and SyncManager to determine if the app is online.

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

// TODO: Implement using `internet_connection_checker`
