class StudentAttendanceRecord {
  final DateTime date;
  final String status; // 'Present', 'Absent', 'Excused'
  final String? note;

  const StudentAttendanceRecord({
    required this.date,
    required this.status,
    this.note,
  });
}
