// app_router.dart
//
// PURPOSE:
// Configures application navigation using `go_router`.
// Defines all routes and handles redirection logic (e.g., redirect to login if not authenticated).
//
// USAGE:
// Inject this router into the `MaterialApp.router`.

import 'package:go_router/go_router.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      // TODO: Define routes
      // GoRoute(path: '/', builder: (context, state) => HomePage()),
      // GoRoute(path: '/login', builder: (context, state) => LoginPage()),
    ],
    // TODO: Add redirect logic for Auth Guard
  );
}
