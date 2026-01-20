import '../entities/student.dart';
import '../repositories/student_repository.dart';

class GetStudentProfile {
  final StudentRepository repository;

  GetStudentProfile(this.repository);

  Future<Student?> call(String studentId) {
    return repository.getStudentById(studentId);
  }
}
