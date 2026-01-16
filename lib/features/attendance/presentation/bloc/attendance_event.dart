// attendance_event.dart
part of 'attendance_bloc.dart';

abstract class AttendanceEvent {}

class LoadAttendance extends AttendanceEvent {
  final DateTime date;
  LoadAttendance(this.date);
}
class MarkAttendance extends AttendanceEvent {
  // final AttendanceRecordEntity record;
  // MarkAttendance(this.record);
}
