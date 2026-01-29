import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'admin_model.freezed.dart';
part 'admin_model.g.dart';

@freezed
@HiveType(typeId: 0)
class AdminModel with _$AdminModel {
  const factory AdminModel({
    @HiveField(0) required String id,
    @HiveField(1) required String name,
    @HiveField(2) required String email,
    @HiveField(3) required bool isSuperAdmin,
    @HiveField(4) List<String>? permissions,
    @HiveField(5) String? phoneNumber,
    @HiveField(6) DateTime? createdAt,
  }) = _AdminModel;

  factory AdminModel.fromJson(Map<String, dynamic> json) =>
      _$AdminModelFromJson(json);
}
