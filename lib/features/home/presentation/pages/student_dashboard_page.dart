import 'package:flutter/material.dart';
import '../../../../features/students/domain/entities/student.dart';
import '../../../../features/students/presentation/pages/student_profile_page.dart';

class StudentDashboardPage extends StatelessWidget {
  const StudentDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock Logged-in Student
    final currentStudent = Student(
      id: 'current-user-123',
      name: 'John Doe',
      grade: '10th',
      group: 'A',
      createdAt: DateTime.now(),
      photoUrl: null,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Portal'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Welcome, ${currentStudent.name}!',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 24),
            _ActionCard(
              title: 'My Profile & Attendance',
              subtitle: 'View your info and history',
              icon: Icons.person,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => StudentProfilePage(
                      student: currentStudent,
                      isAdmin: false, // Explicitly Student View
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            _ActionCard(
              title: 'Announcements',
              subtitle: 'Check latest updates',
              icon: Icons.notifications,
              onTap: () {
                // Future Implementation
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  const _ActionCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
          child: Icon(icon, color: Theme.of(context).primaryColor),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }
}
