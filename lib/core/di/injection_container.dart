// injection_container.dart
//
// PURPOSE:
// Service Locator setup using `get_it`.
// responsible for registering all dependencies:
// - External libraries (Firebase, Hive, Dio, etc.)
// - Data Sources (Remote & Local)
// - Repositories
// - Use Cases
// - BLoCs
//
// USAGE:
// Call `init()` in `main.dart` before `runApp`.
// Retrieve dependencies using `sl<Type>()`.

import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // TODO: Register External Dependencies (Firebase, Hive, etc.)

  // TODO: Register Core Services (NetworkInfo, etc.)

  // TODO: Register Features (Auth, Servants, Attendance)
  // - Data Sources
  // - Repositories
  // - Use Cases
  // - BLoCs
}
