import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/admin_dashboard_cubit.dart';
import '../../../core/repositories/admin_repository.dart';

class AdminDashboardScreen extends StatelessWidget {
  final String adminId;

  const AdminDashboardScreen({super.key, required this.adminId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdminDashboardCubit(
        context.read<AdminRepository>(),
      )..loadDashboard(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Admin Dashboard')),
        body: BlocBuilder<AdminDashboardCubit, AdminDashboardState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Center(child: CircularProgressIndicator()),
              loading: () => const Center(child: CircularProgressIndicator()),
              loaded: (students, servants, totalGroups) => ListView(
                children: [
                    ListTile(
                        title: Text('Total Students: ${students.length}'),
                        subtitle: Text('Groups: $totalGroups'),
                    ),
                    const Divider(),
                    ...students.map((s) => ListTile(
                        title: Text(s.name),
                        subtitle: Text(s.group),
                    )).toList(),
                ],
              ),
              error: (msg) => Center(child: Text('Error: $msg')),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
                // TODO: Add Servant
            },
            child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
