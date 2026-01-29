// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StudentModelAdapter extends TypeAdapter<StudentModel> {
  @override
  final int typeId = 2;

  @override
  StudentModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StudentModel(
      id: fields[0] as String,
      name: fields[1] as String,
      grade: fields[2] as String,
      group: fields[3] as String,
      educationStage: fields[4] as String,
      studentPhone: fields[5] as String?,
      parentsPhones: (fields[6] as List).cast<String>(),
      photoUrl: fields[7] as String?,
      totalPoints: fields[8] as int,
      totalAbsences: fields[9] as int,
      createdAt: fields[10] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, StudentModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.grade)
      ..writeByte(3)
      ..write(obj.group)
      ..writeByte(4)
      ..write(obj.educationStage)
      ..writeByte(5)
      ..write(obj.studentPhone)
      ..writeByte(6)
      ..write(obj.parentsPhones)
      ..writeByte(7)
      ..write(obj.photoUrl)
      ..writeByte(8)
      ..write(obj.totalPoints)
      ..writeByte(9)
      ..write(obj.totalAbsences)
      ..writeByte(10)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StudentModelImpl _$$StudentModelImplFromJson(Map<String, dynamic> json) =>
    _$StudentModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      grade: json['grade'] as String,
      group: json['group'] as String,
      educationStage: json['educationStage'] as String,
      studentPhone: json['studentPhone'] as String?,
      parentsPhones: (json['parentsPhones'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      photoUrl: json['photoUrl'] as String?,
      totalPoints: (json['totalPoints'] as num?)?.toInt() ?? 0,
      totalAbsences: (json['totalAbsences'] as num?)?.toInt() ?? 0,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$StudentModelImplToJson(_$StudentModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'grade': instance.grade,
      'group': instance.group,
      'educationStage': instance.educationStage,
      'studentPhone': instance.studentPhone,
      'parentsPhones': instance.parentsPhones,
      'photoUrl': instance.photoUrl,
      'totalPoints': instance.totalPoints,
      'totalAbsences': instance.totalAbsences,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
