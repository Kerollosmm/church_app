import 'package:flutter/material.dart';

class AttendanceSummaryCard extends StatelessWidget {
  final int presentCount;
  final int absentCount;

  const AttendanceSummaryCard({
    super.key,
    required this.presentCount,
    required this.absentCount,
  });

  @override
  Widget build(BuildContext context) {
    final total = presentCount + absentCount;
    final percentage = total == 0 ? 0 : (presentCount / total * 100).toStringAsFixed(1);

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildStat(context, 'Present', presentCount.toString(), Colors.green),
            _buildStat(context, 'Absent', absentCount.toString(), Colors.red),
            _buildStat(context, 'Rate', '$percentage%', Colors.blue),
          ],
        ),
      ),
    );
  }

  Widget _buildStat(BuildContext context, String label, String value, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: color,
                fontWeight: FontWeight.bold,
              ),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
