import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/models/app_user.dart';
import 'features/auth/bloc/auth_bloc.dart';
import 'features/auth/bloc/auth_state.dart';
import 'features/auth/screens/login_screen.dart';
import 'features/admin/screens/admin_dashboard_screen.dart';
import 'features/servant/screens/servant_group_screen.dart';
import 'features/student/screens/student_profile_screen.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          ),
          loading: () => const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          ),
          authenticated: (AppUser user) => _routeByRole(user),
          unauthenticated: () => const LoginScreen(),
          error: (msg) => Scaffold(body: Center(child: Text(msg))),
        );
      },
    );
  }

  Widget _routeByRole(AppUser user) {
    // COMPOSITION PATTERN IN ACTION:
    // We use linkedId to fetch specific role data, not inheritance
    switch (user.role) {
      case UserRole.admin:
        return AdminDashboardScreen(adminId: user.linkedId);
      case UserRole.servant:
        return ServantGroupScreen(servantId: user.linkedId);
      case UserRole.student:
        return StudentProfileScreen(studentId: user.linkedId);
    }
  }
}
