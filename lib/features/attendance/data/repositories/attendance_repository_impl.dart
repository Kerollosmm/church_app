// attendance_repository_impl.dart
//
// PURPOSE:
// Implementation of AttendanceRepository.
//
// STRATEGY (Offline-First):
// - markAttendance():
//    1. Create record locally in Hive (needsSync: true).
//    2. Trigger background sync.

import '../../domain/repositories/attendance_repository.dart';

class AttendanceRepositoryImpl implements AttendanceRepository {
  // ...
}
