import '../entities/student.dart';

abstract class StudentRepository {
  Future<Student?> getStudentById(String id);
  Future<void> updateStudent(Student student);
  Future<void> deleteStudent(String id);
  Future<List<Student>> getStudentsByGroup(String grade, String group);
}
