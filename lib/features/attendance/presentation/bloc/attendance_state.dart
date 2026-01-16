// attendance_state.dart
part of 'attendance_bloc.dart';

abstract class AttendanceState {}

class AttendanceInitial extends AttendanceState {}
class AttendanceLoading extends AttendanceState {}
class AttendanceLoaded extends AttendanceState {
  // final List<AttendanceRecordEntity> records;
  // AttendanceLoaded(this.records);
}
class AttendanceError extends AttendanceState {
  final String message;
  AttendanceError(this.message);
}
