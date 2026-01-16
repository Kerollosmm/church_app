// attendance_record_entity.dart
//
// PURPOSE:
// Domain entity for an Attendance Record.

class AttendanceRecordEntity {
  final String id;
  final DateTime serviceDate;
  final List<String> presentServantsIds;
  final String markedByUid;
  final DateTime? syncedAt;

  AttendanceRecordEntity({
    required this.id,
    required this.serviceDate,
    required this.presentServantsIds,
    required this.markedByUid,
    this.syncedAt,
  });
}
