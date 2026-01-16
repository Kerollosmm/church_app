// attendance_record_model.dart
//
// PURPOSE:
// Data model for Attendance Record.

import '../../domain/entities/attendance_record_entity.dart';

class AttendanceRecordModel extends AttendanceRecordEntity {
  AttendanceRecordModel({
    required super.id,
    required super.serviceDate,
    required super.presentServantsIds,
    required super.markedByUid,
    super.syncedAt,
  });

  // fromMap
  // toMap
}
