import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/repositories/student_repository.dart';
import '../../../core/models/student_model.dart';
import '../../../core/models/attendance_model.dart';

part 'student_profile_cubit.freezed.dart';

@freezed
class StudentProfileState with _$StudentProfileState {
  const factory StudentProfileState.initial() = _Initial;
  const factory StudentProfileState.loading() = _Loading;
  const factory StudentProfileState.loaded({
    required StudentModel student,
    required List<AttendanceModel> attendanceHistory,
  }) = _Loaded;
  const factory StudentProfileState.error(String message) = _Error;
}

class StudentProfileCubit extends Cubit<StudentProfileState> {
  final StudentRepository _repository;
  final String studentId;

  StudentProfileCubit(this._repository, this.studentId)
      : super(const StudentProfileState.initial());

  Future<void> loadProfile() async {
    emit(const StudentProfileState.loading());
    try {
      final student = await _repository.getMyProfile(studentId);
      final attendance = await _repository.getMyAttendance(studentId);

      emit(StudentProfileState.loaded(
        student: student,
        attendanceHistory: attendance,
      ));
    } catch (e) {
      emit(StudentProfileState.error(e.toString()));
    }
  }
}
