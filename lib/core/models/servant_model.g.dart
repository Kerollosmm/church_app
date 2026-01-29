// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'servant_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ServantModelAdapter extends TypeAdapter<ServantModel> {
  @override
  final int typeId = 1;

  @override
  ServantModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ServantModel(
      id: fields[0] as String,
      name: fields[1] as String,
      assignedGroup: fields[2] as String,
      phoneNumber: fields[3] as String,
      email: fields[4] as String,
      isActive: fields[5] as bool,
      maxStudentsAllowed: fields[6] as int,
      createdAt: fields[7] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, ServantModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.assignedGroup)
      ..writeByte(3)
      ..write(obj.phoneNumber)
      ..writeByte(4)
      ..write(obj.email)
      ..writeByte(5)
      ..write(obj.isActive)
      ..writeByte(6)
      ..write(obj.maxStudentsAllowed)
      ..writeByte(7)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ServantModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServantModelImpl _$$ServantModelImplFromJson(Map<String, dynamic> json) =>
    _$ServantModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      assignedGroup: json['assignedGroup'] as String,
      phoneNumber: json['phoneNumber'] as String,
      email: json['email'] as String,
      isActive: json['isActive'] as bool? ?? false,
      maxStudentsAllowed: (json['maxStudentsAllowed'] as num?)?.toInt() ?? 10,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$ServantModelImplToJson(_$ServantModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'assignedGroup': instance.assignedGroup,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'isActive': instance.isActive,
      'maxStudentsAllowed': instance.maxStudentsAllowed,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
