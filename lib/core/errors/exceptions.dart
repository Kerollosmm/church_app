// exceptions.dart
//
// PURPOSE:
// Defines custom exceptions thrown by Data Sources.
// These are caught by Repositories and converted into Failures.
//
// USAGE:
// Throw these in RemoteDataSource or LocalDataSource implementations when errors occur.

class ServerException implements Exception {
  final String message;
  ServerException(this.message);
}

class CacheException implements Exception {
  final String message;
  CacheException(this.message);
}
