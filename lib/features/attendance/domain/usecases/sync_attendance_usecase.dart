// sync_attendance_usecase.dart
//
// PURPOSE:
// Manually trigger sync for attendance if needed (though SyncManager handles this mostly).

import '../repositories/attendance_repository.dart';

class SyncAttendanceUseCase {
  final AttendanceRepository repository;
  SyncAttendanceUseCase(this.repository);

  // call()
}
