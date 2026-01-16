// attendance_bloc.dart
//
// PURPOSE:
// State management for Attendance screen.
// Events: LoadAttendance, MarkPresent, SyncAttendance.

import 'package:flutter_bloc/flutter_bloc.dart';

part 'attendance_event.dart';
part 'attendance_state.dart';

class AttendanceBloc extends Bloc<AttendanceEvent, AttendanceState> {
  AttendanceBloc() : super(AttendanceInitial()) {
    on<LoadAttendance>((event, emit) {
      // TODO: Call GetAttendanceUseCase
    });

    on<MarkAttendance>((event, emit) {
      // TODO: Call MarkAttendanceUseCase
    });
  }
}
