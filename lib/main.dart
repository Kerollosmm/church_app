import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'core/models/admin_model.dart';
import 'core/models/servant_model.dart';
import 'core/models/student_model.dart';
import 'core/models/attendance_model.dart';
import 'core/repositories/admin_repository.dart';
import 'core/repositories/servant_repository.dart';
import 'core/repositories/student_repository.dart';
import 'features/auth/bloc/auth_bloc.dart';
import 'features/auth/bloc/auth_event.dart';
import 'app_root.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
      await Firebase.initializeApp();
  } catch (e) {
      debugPrint("Firebase init failed: $e");
  }

  await Hive.initFlutter();

  // Register Adapters
  Hive.registerAdapter(AdminModelAdapter());
  Hive.registerAdapter(ServantModelAdapter());
  Hive.registerAdapter(StudentModelAdapter());
  Hive.registerAdapter(AttendanceModelAdapter());

  // Open Boxes
  await Hive.openBox<AdminModel>('admins');
  await Hive.openBox<ServantModel>('servants');
  await Hive.openBox<StudentModel>('students');
  await Hive.openBox<AttendanceModel>('attendance');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (_) => AdminRepository(
            FirebaseFirestore.instance,
            Hive,
          ),
        ),
        RepositoryProvider(
          create: (_) => ServantRepository(
            FirebaseFirestore.instance,
            Hive,
          ),
        ),
        RepositoryProvider(
          create: (_) => StudentRepository(
            FirebaseFirestore.instance,
            Hive,
          ),
        ),
      ],
      child: BlocProvider(
        create: (context) => AuthBloc(
            FirebaseAuth.instance,
            FirebaseFirestore.instance,
        )..add(AuthCheckRequested()),
        child: MaterialApp(
            title: 'CSMS',
            home: const AppRoot(),
            theme: ThemeData(primarySwatch: Colors.blue),
        ),
      ),
    );
  }
}
