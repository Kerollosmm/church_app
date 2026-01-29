import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'student_model.freezed.dart';
part 'student_model.g.dart';

@freezed
@HiveType(typeId: 2)
class StudentModel with _$StudentModel {
  const factory StudentModel({
    @HiveField(0) required String id,
    @HiveField(1) required String name,
    @HiveField(2) required String grade,
    @HiveField(3) required String group,
    @HiveField(4) required String educationStage,
    @HiveField(5) String? studentPhone,
    @HiveField(6) required List<String> parentsPhones,
    @HiveField(7) String? photoUrl,
    @HiveField(8) @Default(0) int totalPoints,
    @HiveField(9) @Default(0) int totalAbsences,
    @HiveField(10) DateTime? createdAt,
  }) = _StudentModel;

  factory StudentModel.fromJson(Map<String, dynamic> json) =>
      _$StudentModelFromJson(json);
}
