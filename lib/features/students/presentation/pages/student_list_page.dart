import 'package:flutter/material.dart';
import '../../domain/entities/student.dart';
import 'student_profile_page.dart';
import 'student_form_page.dart';

class StudentListPage extends StatelessWidget {
  const StudentListPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock Data
    final students = [
      Student(
        id: '1',
        name: 'John Doe',
        grade: '10th',
        group: 'A',
        createdAt: DateTime.now(),
      ),
      Student(
        id: '2',
        name: 'Jane Smith',
        grade: '10th',
        group: 'A',
        createdAt: DateTime.now(),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Students - 10th Grade A'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Search Logic
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          final student = students[index];
          return ListTile(
            leading: CircleAvatar(child: Text(student.name[0])),
            title: Text(student.name),
            subtitle: Text('Present: 90%'), // Placeholder stat
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => StudentProfilePage(
                    student: student,
                    isAdmin: true, // Assuming Admin is viewing the list
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const StudentFormPage(), // Add Mode
            ),
          );
        },
      ),
    );
  }
}
