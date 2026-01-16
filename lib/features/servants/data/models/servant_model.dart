// servant_model.dart
//
// PURPOSE:
// Data model for Servant.
// Handles to/from Firestore Map and Hive.

import '../../domain/entities/servant_entity.dart';

class ServantModel extends ServantEntity {
  ServantModel({
    required super.uid,
    required super.name,
    required super.role,
    super.department,
    super.barcodeId,
  });

  // fromMap
  // toMap
}
