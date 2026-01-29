import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';
import '../models/student_model.dart';
import '../models/servant_model.dart';

class AdminRepository {
  final FirebaseFirestore _firestore;
  final HiveInterface _hive;

  AdminRepository(this._firestore, this._hive);

  // Get ALL students (no filter) - Admin only
  Future<List<StudentModel>> getAllStudents() async {
    final box = _hive.box<StudentModel>('students');

    // Return cache if available
    if (box.isNotEmpty) return box.values.toList();

    // Fetch from Firestore
    final snapshot = await _firestore.collection('students').get();
    final students = snapshot.docs
        .map((d) => StudentModel.fromJson(d.data()))
        .toList();

    // Update cache
    for (var s in students) await box.put(s.id, s);
    return students;
  }

  // Update any student - Admin only
  Future<void> updateStudent(StudentModel student) async {
    // Update Firestore
    await _firestore
        .collection('students')
        .doc(student.id)
        .update(student.toJson());

    // Update Hive
    final box = _hive.box<StudentModel>('students');
    await box.put(student.id, student);
  }

  // Create servant - Admin only
  Future<void> createServant(ServantModel servant) async {
    await _firestore
        .collection('servants')
        .doc(servant.id)
        .set(servant.toJson());

    final box = _hive.box<ServantModel>('servants');
    await box.put(servant.id, servant);
  }
}
