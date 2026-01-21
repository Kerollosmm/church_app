import '../entities/student_attendance_record.dart';

class GetStudentAttendanceHistory {
  // Repository dependency would go here

  Future<List<StudentAttendanceRecord>> call(String studentId) async {
    // Mock Data
    return [
      StudentAttendanceRecord(date: DateTime.now().subtract(const Duration(days: 1)), status: 'Present'),
      StudentAttendanceRecord(date: DateTime.now().subtract(const Duration(days: 7)), status: 'Absent', note: 'Sick'),
      StudentAttendanceRecord(date: DateTime.now().subtract(const Duration(days: 14)), status: 'Present'),
    ];
  }
}
