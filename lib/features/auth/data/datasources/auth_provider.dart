import '../../domain/entities/auth_user.dart';

abstract class AuthProvider {
  Stream<AuthUser?> onAuthStateChanged();
  Future<AuthUser> signIn({
    required String email,
    required String password,
  });
  Future<void> signOut();
}
