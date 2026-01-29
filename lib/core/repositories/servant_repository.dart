import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';
import '../models/servant_model.dart';
import '../models/student_model.dart';
import '../models/attendance_model.dart';

class ServantRepository {
  final FirebaseFirestore _firestore;
  final HiveInterface _hive;

  ServantRepository(this._firestore, this._hive);

  // Get servant profile
  Future<ServantModel> getServantProfile(String id) async {
    final box = _hive.box<ServantModel>('servants');
    final cached = box.get(id);
    if (cached != null) return cached;

    final doc = await _firestore.collection('servants').doc(id).get();
    if (!doc.exists) {
        throw Exception('Servant not found');
    }
    final servant = ServantModel.fromJson(doc.data()!);
    await box.put(id, servant);
    return servant;
  }

  // CRITICAL: Get students of specific group only
  Future<List<StudentModel>> getMyGroupStudents(String group) async {
    final box = _hive.box<StudentModel>('students');

    // Filter from cache
    final cached = box.values.where((s) => s.group == group).toList();
    if (cached.isNotEmpty) return cached;

    // Query Firestore
    final snapshot = await _firestore
        .collection('students')
        .where('group', isEqualTo: group)
        .get();

    final students = snapshot.docs
        .map((d) => StudentModel.fromJson(d.data()))
        .toList();

    // Cache individually
    for (var s in students) await box.put(s.id, s);
    return students;
  }

  // Record attendance with offline support
  Future<void> recordAttendance(AttendanceModel attendance) async {
    final box = _hive.box<AttendanceModel>('attendance');

    // 1. Save locally first (unsynced)
    final localRecord = attendance.copyWith(synced: false);
    await box.put(attendance.id, localRecord);

    // 2. Try to sync
    try {
      await _firestore
          .collection('attendance')
          .doc(attendance.id)
          .set(attendance.toJson());

      // Mark as synced
      await box.put(attendance.id, localRecord.copyWith(synced: true));
    } catch (e) {
      // Will remain unsynced for background sync later
      print('Offline: Saved to queue');
    }
  }

  // Background sync (call on app start)
  Future<void> syncPendingAttendance() async {
    final box = _hive.box<AttendanceModel>('attendance');
    final pending = box.values.where((a) => !a.synced).toList();

    for (var record in pending) {
      try {
        await _firestore
            .collection('attendance')
            .doc(record.id)
            .set(record.toJson());
        await box.put(record.id, record.copyWith(synced: true));
      } catch (e) {
        print('Sync failed for ${record.id}');
      }
    }
  }
}
