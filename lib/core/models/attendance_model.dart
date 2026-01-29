import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'attendance_model.freezed.dart';
part 'attendance_model.g.dart';

@freezed
@HiveType(typeId: 3)
class AttendanceModel with _$AttendanceModel {
  const factory AttendanceModel({
    @HiveField(0) required String id,
    @HiveField(1) required String studentId,
    @HiveField(2) required String servantId,
    @HiveField(3) required DateTime date,
    @HiveField(4) required bool isPresent,
    @HiveField(5) String? notes,
    @HiveField(6) DateTime? recordedAt,
    @HiveField(7) @Default(false) bool synced,
  }) = _AttendanceModel;

  factory AttendanceModel.fromJson(Map<String, dynamic> json) =>
      _$AttendanceModelFromJson(json);
}
