import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/repositories/admin_repository.dart';
import '../../../core/models/student_model.dart';
import '../../../core/models/servant_model.dart';

part 'admin_dashboard_cubit.freezed.dart';

@freezed
class AdminDashboardState with _$AdminDashboardState {
  const factory AdminDashboardState.initial() = _Initial;
  const factory AdminDashboardState.loading() = _Loading;
  const factory AdminDashboardState.loaded({
    required List<StudentModel> students,
    required List<ServantModel> servants,
    required int totalGroups,
  }) = _Loaded;
  const factory AdminDashboardState.error(String message) = _Error;
}

class AdminDashboardCubit extends Cubit<AdminDashboardState> {
  final AdminRepository _repository;

  AdminDashboardCubit(this._repository)
      : super(const AdminDashboardState.initial());

  Future<void> loadDashboard() async {
    emit(const AdminDashboardState.loading());
    try {
      final students = await _repository.getAllStudents();
      // Servants loading not implemented in repository yet

      final groups = students.map((s) => s.group).toSet().length;

      emit(AdminDashboardState.loaded(
        students: students,
        servants: [],
        totalGroups: groups,
      ));
    } catch (e) {
      emit(AdminDashboardState.error(e.toString()));
    }
  }

  Future<void> updateStudent(StudentModel student) async {
    try {
      await _repository.updateStudent(student);
      await loadDashboard(); // Refresh
    } catch (e) {
      emit(AdminDashboardState.error(e.toString()));
    }
  }
}
