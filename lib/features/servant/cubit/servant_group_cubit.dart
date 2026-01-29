import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/repositories/servant_repository.dart';
import '../../../core/models/servant_model.dart';
import '../../../core/models/student_model.dart';
import '../../../core/models/attendance_model.dart';

part 'servant_group_cubit.freezed.dart';

@freezed
class ServantGroupState with _$ServantGroupState {
  const factory ServantGroupState.initial() = _Initial;
  const factory ServantGroupState.loading() = _Loading;
  const factory ServantGroupState.loaded({
    required ServantModel servant,
    required List<StudentModel> students,
    required Map<String, bool> todayAttendance,
  }) = _Loaded;
  const factory ServantGroupState.error(String message) = _Error;
  const factory ServantGroupState.attendanceSaved() = _AttendanceSaved;
}

class ServantGroupCubit extends Cubit<ServantGroupState> {
  final ServantRepository _repository;
  final String servantId;

  ServantGroupCubit(this._repository, this.servantId)
      : super(const ServantGroupState.initial());

  Future<void> loadGroup() async {
    emit(const ServantGroupState.loading());
    try {
      final servant = await _repository.getServantProfile(servantId);
      final students = await _repository.getMyGroupStudents(servant.assignedGroup);

      emit(ServantGroupState.loaded(
        servant: servant,
        students: students,
        todayAttendance: {},
      ));
    } catch (e) {
      emit(ServantGroupState.error(e.toString()));
    }
  }

  Future<void> submitAttendance(DateTime date, Map<String, bool> attendance) async {
    try {
      for (var entry in attendance.entries) {
        final record = AttendanceModel(
          id: DateTime.now().millisecondsSinceEpoch.toString() + entry.key,
          studentId: entry.key,
          servantId: servantId,
          date: date,
          isPresent: entry.value,
          recordedAt: DateTime.now(),
        );
        await _repository.recordAttendance(record);
      }
      emit(const ServantGroupState.attendanceSaved());
      await loadGroup();
    } catch (e) {
      emit(ServantGroupState.error(e.toString()));
    }
  }
}
