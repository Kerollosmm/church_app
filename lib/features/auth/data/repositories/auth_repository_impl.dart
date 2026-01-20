import '../../domain/entities/auth_user.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl();

  @override
  Future<AuthUser?> currentUser() async {
    return null;
  }

  @override
  Future<AuthUser> signIn({
    required String email,
    required String password,
  }) async {
    return AuthUser(id: 'placeholder', email: email);
  }

  @override
  Future<void> signOut() async {}
}
