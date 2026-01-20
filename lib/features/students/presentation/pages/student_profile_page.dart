import 'package:flutter/material.dart';
import '../../domain/entities/student.dart';
import '../widgets/attendance_summary_card.dart';

class StudentProfilePage extends StatelessWidget {
  final Student student;
  final bool isAdmin; // Determines if edit/delete actions are shown

  const StudentProfilePage({
    super.key,
    required this.student,
    this.isAdmin = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Profile'),
        actions: [
          if (isAdmin)
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                // Navigate to edit page
              },
            ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildHeader(context),
            const SizedBox(height: 24),
            // TODO: Fetch real attendance stats
            const AttendanceSummaryCard(presentCount: 0, absentCount: 0),
            const SizedBox(height: 24),
            _buildInfoCard(context),
            const SizedBox(height: 24),
            if (isAdmin) _buildAdminActions(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: student.photoUrl != null
              ? NetworkImage(student.photoUrl!)
              : null,
          child: student.photoUrl == null
              ? Text(student.name[0], style: const TextStyle(fontSize: 40))
              : null,
        ),
        const SizedBox(height: 16),
        Text(
          student.name,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Text(
          '${student.grade} - ${student.group}',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
        ),
      ],
    );
  }

  Widget _buildInfoCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildInfoRow(context, Icons.phone, 'Phone', student.phoneNumber),
            const Divider(),
            _buildInfoRow(context, Icons.home, 'Address', student.address),
            const Divider(),
            _buildInfoRow(context, Icons.person, 'Parent', student.parentName),
            const Divider(),
            _buildInfoRow(context, Icons.phone_android, 'Parent Phone', student.parentPhone),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, IconData icon, String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                value ?? 'N/A',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAdminActions(BuildContext context) {
    return Column(
      children: [
        ElevatedButton.icon(
          onPressed: () {
            // Logic to delete student
          },
          icon: const Icon(Icons.delete),
          label: const Text('Delete Student'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.error,
            foregroundColor: Theme.of(context).colorScheme.onError,
          ),
        ),
      ],
    );
  }
}
