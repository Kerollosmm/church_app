import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_students_by_group.dart';
import 'student_event_state.dart';

// Export Event/State for easy access
export 'student_event_state.dart';

class StudentBloc extends Bloc<StudentEvent, StudentState> {
  final GetStudentsByGroup getStudentsByGroup;

  StudentBloc({required this.getStudentsByGroup}) : super(StudentInitial()) {
    on<LoadStudents>(_onLoadStudents);
  }

  Future<void> _onLoadStudents(
    LoadStudents event,
    Emitter<StudentState> emit,
  ) async {
    emit(StudentLoading());
    try {
      final students = await getStudentsByGroup(event.grade, event.group);
      emit(StudentLoaded(students));
    } catch (e) {
      emit(StudentError(e.toString()));
    }
  }
}
