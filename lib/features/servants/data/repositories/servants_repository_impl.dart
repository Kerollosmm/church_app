// servants_repository_impl.dart
//
// PURPOSE:
// Implementation of ServantsRepository.
//
// STRATEGY (Offline-First):
// - getServants():
//    1. Return data from LocalDataSource (Hive).
//    2. If Online, fetch from RemoteDataSource (Firestore), update Local, and yield updated list.
// - addServant():
//    1. Save to LocalDataSource with `needsSync: true`.
//    2. If Online, try to sync immediately (or let SyncManager handle it).

import '../../domain/repositories/servants_repository.dart';

class ServantsRepositoryImpl implements ServantsRepository {
  // ...
}
