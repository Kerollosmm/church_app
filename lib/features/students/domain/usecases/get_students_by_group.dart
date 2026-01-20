import '../entities/student.dart';
import '../repositories/student_repository.dart';

class GetStudentsByGroup {
  final StudentRepository repository;

  GetStudentsByGroup(this.repository);

  Future<List<Student>> call(String grade, String group) {
    return repository.getStudentsByGroup(grade, group);
  }
}
