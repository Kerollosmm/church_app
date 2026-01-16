// servant_entity.dart
//
// PURPOSE:
// Domain entity for a Servant.

class ServantEntity {
  final String uid;
  final String name;
  final String role;
  final String? department;
  final String? barcodeId;

  ServantEntity({
    required this.uid,
    required this.name,
    required this.role,
    this.department,
    this.barcodeId,
  });
}
