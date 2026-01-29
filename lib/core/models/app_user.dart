import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

enum UserRole { admin, servant, student }

@freezed
class AppUser with _$AppUser {
  const factory AppUser({
    required String uid,              // Firebase Auth UID
    required String email,
    required String name,
    required UserRole role,           // Determines routing
    required String linkedId,         // FK to specific model
    String? photoUrl,
    DateTime? createdAt,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);
}

extension AppUserX on AppUser {
  bool get isAdmin => role == UserRole.admin;
  bool get isServant => role == UserRole.servant;
  bool get isStudent => role == UserRole.student;
}
