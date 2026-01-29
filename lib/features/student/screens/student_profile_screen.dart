import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/student_profile_cubit.dart';
import '../../../core/repositories/student_repository.dart';

class StudentProfileScreen extends StatelessWidget {
  final String studentId;

  const StudentProfileScreen({super.key, required this.studentId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StudentProfileCubit(
        context.read<StudentRepository>(),
        studentId,
      )..loadProfile(),
      child: Scaffold(
        appBar: AppBar(title: const Text('My Profile')),
        body: BlocBuilder<StudentProfileCubit, StudentProfileState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Center(child: CircularProgressIndicator()),
              loading: () => const Center(child: CircularProgressIndicator()),
              loaded: (student, attendance) => ListView(
                children: [
                  UserAccountsDrawerHeader(
                    accountName: Text(student.name),
                    accountEmail: Text(student.group),
                    currentAccountPicture: CircleAvatar(
                        backgroundImage: student.photoUrl != null
                            ? NetworkImage(student.photoUrl!)
                            : null,
                        child: student.photoUrl == null
                            ? const Icon(Icons.person)
                            : null,
                    ),
                  ),
                  ListTile(
                    title: const Text('Total Points'),
                    trailing: Text(student.totalPoints.toString()),
                  ),
                  ListTile(
                    title: const Text('Total Absences'),
                    trailing: Text(student.totalAbsences.toString()),
                  ),
                  const Divider(),
                  const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text('Attendance History', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  ...attendance.map((a) => ListTile(
                    title: Text(a.date.toString().split(' ')[0]),
                    trailing: Icon(
                        a.isPresent ? Icons.check_circle : Icons.cancel,
                        color: a.isPresent ? Colors.green : Colors.red,
                    ),
                  )),
                ],
              ),
              error: (msg) => Center(child: Text('Error: $msg')),
            );
          },
        ),
      ),
    );
  }
}
