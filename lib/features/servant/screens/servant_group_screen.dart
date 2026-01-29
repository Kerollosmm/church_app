import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/servant_group_cubit.dart';
import '../../../core/repositories/servant_repository.dart';

class ServantGroupScreen extends StatefulWidget {
  final String servantId;

  const ServantGroupScreen({super.key, required this.servantId});

  @override
  State<ServantGroupScreen> createState() => _ServantGroupScreenState();
}

class _ServantGroupScreenState extends State<ServantGroupScreen> {
  Map<String, bool> attendance = {};

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ServantGroupCubit(
        context.read<ServantRepository>(),
        widget.servantId,
      )..loadGroup(),
      child: Scaffold(
        appBar: AppBar(title: const Text('My Group')),
        body: BlocConsumer<ServantGroupCubit, ServantGroupState>(
          listener: (context, state) {
            state.whenOrNull(
              attendanceSaved: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Attendance Saved!')),
                );
                setState(() {
                    attendance.clear();
                });
              },
              error: (msg) => ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(msg)),
              ),
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => const Center(child: CircularProgressIndicator()),
              loaded: (servant, students, _) {
                return Column(
                  children: [
                    ListTile(
                      title: Text(servant.name),
                      subtitle: Text('Group: ${servant.assignedGroup}'),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: students.length,
                        itemBuilder: (context, index) {
                          final student = students[index];
                          final isPresent = attendance[student.id] ?? false;
                          return SwitchListTile(
                            title: Text(student.name),
                            value: isPresent,
                            onChanged: (val) {
                              setState(() {
                                attendance[student.id] = val;
                              });
                            },
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          context.read<ServantGroupCubit>().submitAttendance(
                                DateTime.now(),
                                attendance,
                              );
                        },
                        child: const Text('Submit Attendance'),
                      ),
                    ),
                  ],
                );
              },
              orElse: () => const SizedBox(),
            );
          },
        ),
      ),
    );
  }
}
