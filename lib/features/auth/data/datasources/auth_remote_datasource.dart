// auth_remote_datasource.dart
//
// PURPOSE:
// Handles authentication against Firebase Auth.
//
// METHODS:
// - signIn(email, password)
// - signOut()
// - getCurrentUser()

abstract class AuthRemoteDataSource {
  Future<void> signIn(String email, String password);
  Future<void> signOut();
  // ...
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  // TODO: Implement using FirebaseAuth
  @override
  Future<void> signIn(String email, String password) async {
    // ...
  }

  @override
  Future<void> signOut() async {
    // ...
  }
}
