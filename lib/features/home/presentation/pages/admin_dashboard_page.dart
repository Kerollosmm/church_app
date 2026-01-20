import 'package:flutter/material.dart';
import '../../../../features/students/presentation/pages/student_list_page.dart';

class AdminDashboardPage extends StatelessWidget {
  const AdminDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16),
        children: [
          _DashboardCard(
            icon: Icons.people,
            label: 'Manage Students',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const StudentListPage()),
              );
            },
          ),
          _DashboardCard(
            icon: Icons.assignment,
            label: 'Attendance Reports',
            onTap: () {
              // Navigate to Reports (Future Implementation)
            },
          ),
          // Add more admin cards here
        ],
      ),
    );
  }
}

class _DashboardCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _DashboardCard({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: Theme.of(context).primaryColor),
            const SizedBox(height: 16),
            Text(label, style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ),
    );
  }
}
