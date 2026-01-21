import 'package:flutter/material.dart';
import '../../features/home/presentation/pages/admin_dashboard_page.dart';

void main() {
  runApp(const AdminApp());
}

class AdminApp extends StatelessWidget {
  const AdminApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CSMS Admin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const AdminDashboardPage(),
    );
  }
}
