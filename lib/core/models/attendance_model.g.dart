// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AttendanceModelAdapter extends TypeAdapter<AttendanceModel> {
  @override
  final int typeId = 3;

  @override
  AttendanceModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AttendanceModel(
      id: fields[0] as String,
      studentId: fields[1] as String,
      servantId: fields[2] as String,
      date: fields[3] as DateTime,
      isPresent: fields[4] as bool,
      notes: fields[5] as String?,
      recordedAt: fields[6] as DateTime?,
      synced: fields[7] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, AttendanceModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.studentId)
      ..writeByte(2)
      ..write(obj.servantId)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.isPresent)
      ..writeByte(5)
      ..write(obj.notes)
      ..writeByte(6)
      ..write(obj.recordedAt)
      ..writeByte(7)
      ..write(obj.synced);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AttendanceModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttendanceModelImpl _$$AttendanceModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AttendanceModelImpl(
      id: json['id'] as String,
      studentId: json['studentId'] as String,
      servantId: json['servantId'] as String,
      date: DateTime.parse(json['date'] as String),
      isPresent: json['isPresent'] as bool,
      notes: json['notes'] as String?,
      recordedAt: json['recordedAt'] == null
          ? null
          : DateTime.parse(json['recordedAt'] as String),
      synced: json['synced'] as bool? ?? false,
    );

Map<String, dynamic> _$$AttendanceModelImplToJson(
        _$AttendanceModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'studentId': instance.studentId,
      'servantId': instance.servantId,
      'date': instance.date.toIso8601String(),
      'isPresent': instance.isPresent,
      'notes': instance.notes,
      'recordedAt': instance.recordedAt?.toIso8601String(),
      'synced': instance.synced,
    };
