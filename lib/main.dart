// main.dart
//
// PURPOSE:
// Entry point of the application.
//
// RESPONSIBILITIES:
// 1. Initialize WidgetsFlutterBinding.
// 2. Initialize Firebase (`Firebase.initializeApp`).
// 3. Initialize Hive (`HiveStorageService`).
// 4. Initialize Dependency Injection (`di.init()`).
// 5. Start SyncManager (if needed).
// 6. Run the App (`runApp(MyApp)`).

import 'package:flutter/material.dart';
import 'core/di/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // TODO: Await Firebase.initializeApp()
  // TODO: Await Hive init

  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Setup MultiBlocProvider
    // TODO: Setup MaterialApp.router
    return MaterialApp(
      title: 'CSMS',
      home: Scaffold(body: Center(child: Text('CSMS App'))),
    );
  }
}
