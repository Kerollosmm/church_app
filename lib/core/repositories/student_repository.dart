import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';
import '../models/student_model.dart';
import '../models/attendance_model.dart';

class StudentRepository {
  final FirebaseFirestore _firestore;
  final HiveInterface _hive;

  StudentRepository(this._firestore, this._hive);

  // Get own profile only
  Future<StudentModel> getMyProfile(String id) async {
    final box = _hive.box<StudentModel>('students');
    final cached = box.get(id);
    if (cached != null) return cached;

    final doc = await _firestore.collection('students').doc(id).get();
    if (!doc.exists) {
        throw Exception('Student not found');
    }
    final student = StudentModel.fromJson(doc.data()!);
    await box.put(id, student);
    return student;
  }

  // Get own attendance history
  Future<List<AttendanceModel>> getMyAttendance(String studentId) async {
    final box = _hive.box<AttendanceModel>('attendance');

    // Filter local cache
    final cached = box.values
        .where((a) => a.studentId == studentId)
        .toList();
    if (cached.isNotEmpty) return cached;

    // Query Firestore
    final snapshot = await _firestore
        .collection('attendance')
        .where('studentId', isEqualTo: studentId)
        .orderBy('date', descending: true)
        .get();

    final records = snapshot.docs
        .map((d) => AttendanceModel.fromJson(d.data()))
        .toList();

    for (var r in records) await box.put(r.id, r);
    return records;
  }
}
