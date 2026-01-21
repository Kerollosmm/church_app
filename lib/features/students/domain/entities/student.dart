import 'package:equatable/equatable.dart';

class Student extends Equatable {
  final String id;
  final String name;
  final String grade;
  final String group;
  final String? phoneNumber;
  final String? address;
  final String? parentName;
  final String? parentPhone;
  final DateTime createdAt;
  final String? photoUrl;

  const Student({
    required this.id,
    required this.name,
    required this.grade,
    required this.group,
    this.phoneNumber,
    this.address,
    this.parentName,
    this.parentPhone,
    required this.createdAt,
    this.photoUrl,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        grade,
        group,
        phoneNumber,
        address,
        parentName,
        parentPhone,
        createdAt,
        photoUrl,
      ];
}
