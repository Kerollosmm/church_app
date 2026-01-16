// auth_local_datasource.dart
//
// PURPOSE:
// Handles caching of the authenticated user and tokens.
//
// METHODS:
// - cacheUser(UserModel)
// - getLastUser()
// - cacheToken(String)
// - getToken()

abstract class AuthLocalDataSource {
  Future<void> cacheUser(dynamic user); // Replace dynamic with UserModel
  // ...
}
