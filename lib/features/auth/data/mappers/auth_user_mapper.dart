import '../../domain/entities/auth_user.dart';
import '../models/auth_user_model.dart';

class AuthUserMapper {
  AuthUser toEntity(AuthUserModel model) {
    return AuthUser(id: model.id, email: model.email);
  }
}
