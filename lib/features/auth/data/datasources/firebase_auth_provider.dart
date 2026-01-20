import '../../domain/entities/auth_user.dart';
import 'auth_provider.dart';

class FirebaseAuthProvider implements AuthProvider {
  @override
  Stream<AuthUser?> onAuthStateChanged() => const Stream.empty();

  @override
  Future<AuthUser> signIn({
    required String email,
    required String password,
  }) async {
    return AuthUser(id: 'firebase', email: email);
  }

  @override
  Future<void> signOut() async {}
}
