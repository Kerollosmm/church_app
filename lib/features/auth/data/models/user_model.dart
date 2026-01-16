// user_model.dart
//
// PURPOSE:
// Data model for User, extends/implements UserEntity.
// Handles JSON serialization/deserialization and Hive adapter mapping.

import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.uid, required super.email, required super.role});

  // fromJson
  // toJson
}
