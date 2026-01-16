// user_entity.dart
//
// PURPOSE:
// Core entity representing a User (Servant/Admin) in the Domain layer.
// Pure Dart class, no dependencies.

class UserEntity {
  final String uid;
  final String email;
  final String role; // 'admin', 'servant'

  UserEntity({required this.uid, required this.email, required this.role});
}
