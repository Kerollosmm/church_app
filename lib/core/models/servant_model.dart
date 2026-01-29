import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'servant_model.freezed.dart';
part 'servant_model.g.dart';

@freezed
@HiveType(typeId: 1)
class ServantModel with _$ServantModel {
  const factory ServantModel({
    @HiveField(0) required String id,
    @HiveField(1) required String name,
    @HiveField(2) required String assignedGroup,
    @HiveField(3) required String phoneNumber,
    @HiveField(4) required String email,
    @HiveField(5) @Default(false) bool isActive,
    @HiveField(6) @Default(10) int maxStudentsAllowed,
    @HiveField(7) DateTime? createdAt,
  }) = _ServantModel;

  factory ServantModel.fromJson(Map<String, dynamic> json) =>
      _$ServantModelFromJson(json);
}
