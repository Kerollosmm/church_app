import 'package:flutter/material.dart';

class SyncIndicator extends StatelessWidget {
  final String status; // Replace with SyncStatus enum usage in real impl

  const SyncIndicator({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Placeholder for Sync Indicator UI
      child: Text(status),
    );
  }
}
