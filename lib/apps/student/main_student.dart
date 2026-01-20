import 'package:flutter/material.dart';
import '../../features/home/presentation/pages/student_dashboard_page.dart';

void main() {
  runApp(const StudentApp());
}

class StudentApp extends StatelessWidget {
  const StudentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CSMS Student',
      theme: ThemeData(
        primarySwatch: Colors.green, // Differentiate theme
        useMaterial3: true,
      ),
      home: const StudentDashboardPage(),
    );
  }
}
