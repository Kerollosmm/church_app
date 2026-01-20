import 'package:flutter/material.dart';
import '../../domain/usecases/get_student_attendance_history.dart';
import '../../domain/entities/student_attendance_record.dart';

class StudentAttendanceHistoryPage extends StatelessWidget {
  final String studentId;

  const StudentAttendanceHistoryPage({super.key, required this.studentId});

  @override
  Widget build(BuildContext context) {
    // In real app, use FutureBuilder or Bloc
    final useCase = GetStudentAttendanceHistory();

    return Scaffold(
      appBar: AppBar(title: const Text('Attendance History')),
      body: FutureBuilder<List<StudentAttendanceRecord>>(
        future: useCase(studentId),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());

          final records = snapshot.data!;
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: records.length,
            separatorBuilder: (_, __) => const Divider(),
            itemBuilder: (context, index) {
              final record = records[index];
              final isAbsent = record.status == 'Absent';

              return ListTile(
                leading: Icon(
                  isAbsent ? Icons.cancel : Icons.check_circle,
                  color: isAbsent ? Colors.red : Colors.green,
                ),
                title: Text(record.date.toString().split(' ')[0]), // Format Date properly in real app
                subtitle: record.note != null ? Text(record.note!) : null,
                trailing: Text(
                  record.status,
                  style: TextStyle(
                    color: isAbsent ? Colors.red : Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
