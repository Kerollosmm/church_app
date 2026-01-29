// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'servant_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ServantModel _$ServantModelFromJson(Map<String, dynamic> json) {
  return _ServantModel.fromJson(json);
}

/// @nodoc
mixin _$ServantModel {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  String get assignedGroup => throw _privateConstructorUsedError;
  @HiveField(3)
  String get phoneNumber => throw _privateConstructorUsedError;
  @HiveField(4)
  String get email => throw _privateConstructorUsedError;
  @HiveField(5)
  bool get isActive => throw _privateConstructorUsedError;
  @HiveField(6)
  int get maxStudentsAllowed => throw _privateConstructorUsedError;
  @HiveField(7)
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServantModelCopyWith<ServantModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServantModelCopyWith<$Res> {
  factory $ServantModelCopyWith(
          ServantModel value, $Res Function(ServantModel) then) =
      _$ServantModelCopyWithImpl<$Res, ServantModel>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) String assignedGroup,
      @HiveField(3) String phoneNumber,
      @HiveField(4) String email,
      @HiveField(5) bool isActive,
      @HiveField(6) int maxStudentsAllowed,
      @HiveField(7) DateTime? createdAt});
}

/// @nodoc
class _$ServantModelCopyWithImpl<$Res, $Val extends ServantModel>
    implements $ServantModelCopyWith<$Res> {
  _$ServantModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? assignedGroup = null,
    Object? phoneNumber = null,
    Object? email = null,
    Object? isActive = null,
    Object? maxStudentsAllowed = null,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      assignedGroup: null == assignedGroup
          ? _value.assignedGroup
          : assignedGroup // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      maxStudentsAllowed: null == maxStudentsAllowed
          ? _value.maxStudentsAllowed
          : maxStudentsAllowed // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServantModelImplCopyWith<$Res>
    implements $ServantModelCopyWith<$Res> {
  factory _$$ServantModelImplCopyWith(
          _$ServantModelImpl value, $Res Function(_$ServantModelImpl) then) =
      __$$ServantModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) String assignedGroup,
      @HiveField(3) String phoneNumber,
      @HiveField(4) String email,
      @HiveField(5) bool isActive,
      @HiveField(6) int maxStudentsAllowed,
      @HiveField(7) DateTime? createdAt});
}

/// @nodoc
class __$$ServantModelImplCopyWithImpl<$Res>
    extends _$ServantModelCopyWithImpl<$Res, _$ServantModelImpl>
    implements _$$ServantModelImplCopyWith<$Res> {
  __$$ServantModelImplCopyWithImpl(
      _$ServantModelImpl _value, $Res Function(_$ServantModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? assignedGroup = null,
    Object? phoneNumber = null,
    Object? email = null,
    Object? isActive = null,
    Object? maxStudentsAllowed = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$ServantModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      assignedGroup: null == assignedGroup
          ? _value.assignedGroup
          : assignedGroup // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      maxStudentsAllowed: null == maxStudentsAllowed
          ? _value.maxStudentsAllowed
          : maxStudentsAllowed // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServantModelImpl implements _ServantModel {
  const _$ServantModelImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.name,
      @HiveField(2) required this.assignedGroup,
      @HiveField(3) required this.phoneNumber,
      @HiveField(4) required this.email,
      @HiveField(5) this.isActive = false,
      @HiveField(6) this.maxStudentsAllowed = 10,
      @HiveField(7) this.createdAt});

  factory _$ServantModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServantModelImplFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String name;
  @override
  @HiveField(2)
  final String assignedGroup;
  @override
  @HiveField(3)
  final String phoneNumber;
  @override
  @HiveField(4)
  final String email;
  @override
  @JsonKey()
  @HiveField(5)
  final bool isActive;
  @override
  @JsonKey()
  @HiveField(6)
  final int maxStudentsAllowed;
  @override
  @HiveField(7)
  final DateTime? createdAt;

  @override
  String toString() {
    return 'ServantModel(id: $id, name: $name, assignedGroup: $assignedGroup, phoneNumber: $phoneNumber, email: $email, isActive: $isActive, maxStudentsAllowed: $maxStudentsAllowed, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServantModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.assignedGroup, assignedGroup) ||
                other.assignedGroup == assignedGroup) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.maxStudentsAllowed, maxStudentsAllowed) ||
                other.maxStudentsAllowed == maxStudentsAllowed) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, assignedGroup,
      phoneNumber, email, isActive, maxStudentsAllowed, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServantModelImplCopyWith<_$ServantModelImpl> get copyWith =>
      __$$ServantModelImplCopyWithImpl<_$ServantModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServantModelImplToJson(
      this,
    );
  }
}

abstract class _ServantModel implements ServantModel {
  const factory _ServantModel(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String name,
      @HiveField(2) required final String assignedGroup,
      @HiveField(3) required final String phoneNumber,
      @HiveField(4) required final String email,
      @HiveField(5) final bool isActive,
      @HiveField(6) final int maxStudentsAllowed,
      @HiveField(7) final DateTime? createdAt}) = _$ServantModelImpl;

  factory _ServantModel.fromJson(Map<String, dynamic> json) =
      _$ServantModelImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get name;
  @override
  @HiveField(2)
  String get assignedGroup;
  @override
  @HiveField(3)
  String get phoneNumber;
  @override
  @HiveField(4)
  String get email;
  @override
  @HiveField(5)
  bool get isActive;
  @override
  @HiveField(6)
  int get maxStudentsAllowed;
  @override
  @HiveField(7)
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$ServantModelImplCopyWith<_$ServantModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
