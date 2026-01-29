// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AdminModel _$AdminModelFromJson(Map<String, dynamic> json) {
  return _AdminModel.fromJson(json);
}

/// @nodoc
mixin _$AdminModel {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  String get email => throw _privateConstructorUsedError;
  @HiveField(3)
  bool get isSuperAdmin => throw _privateConstructorUsedError;
  @HiveField(4)
  List<String>? get permissions => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get phoneNumber => throw _privateConstructorUsedError;
  @HiveField(6)
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdminModelCopyWith<AdminModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminModelCopyWith<$Res> {
  factory $AdminModelCopyWith(
          AdminModel value, $Res Function(AdminModel) then) =
      _$AdminModelCopyWithImpl<$Res, AdminModel>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) String email,
      @HiveField(3) bool isSuperAdmin,
      @HiveField(4) List<String>? permissions,
      @HiveField(5) String? phoneNumber,
      @HiveField(6) DateTime? createdAt});
}

/// @nodoc
class _$AdminModelCopyWithImpl<$Res, $Val extends AdminModel>
    implements $AdminModelCopyWith<$Res> {
  _$AdminModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? isSuperAdmin = null,
    Object? permissions = freezed,
    Object? phoneNumber = freezed,
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
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      isSuperAdmin: null == isSuperAdmin
          ? _value.isSuperAdmin
          : isSuperAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      permissions: freezed == permissions
          ? _value.permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdminModelImplCopyWith<$Res>
    implements $AdminModelCopyWith<$Res> {
  factory _$$AdminModelImplCopyWith(
          _$AdminModelImpl value, $Res Function(_$AdminModelImpl) then) =
      __$$AdminModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) String email,
      @HiveField(3) bool isSuperAdmin,
      @HiveField(4) List<String>? permissions,
      @HiveField(5) String? phoneNumber,
      @HiveField(6) DateTime? createdAt});
}

/// @nodoc
class __$$AdminModelImplCopyWithImpl<$Res>
    extends _$AdminModelCopyWithImpl<$Res, _$AdminModelImpl>
    implements _$$AdminModelImplCopyWith<$Res> {
  __$$AdminModelImplCopyWithImpl(
      _$AdminModelImpl _value, $Res Function(_$AdminModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? isSuperAdmin = null,
    Object? permissions = freezed,
    Object? phoneNumber = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$AdminModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      isSuperAdmin: null == isSuperAdmin
          ? _value.isSuperAdmin
          : isSuperAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      permissions: freezed == permissions
          ? _value._permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AdminModelImpl implements _AdminModel {
  const _$AdminModelImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.name,
      @HiveField(2) required this.email,
      @HiveField(3) required this.isSuperAdmin,
      @HiveField(4) final List<String>? permissions,
      @HiveField(5) this.phoneNumber,
      @HiveField(6) this.createdAt})
      : _permissions = permissions;

  factory _$AdminModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdminModelImplFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String name;
  @override
  @HiveField(2)
  final String email;
  @override
  @HiveField(3)
  final bool isSuperAdmin;
  final List<String>? _permissions;
  @override
  @HiveField(4)
  List<String>? get permissions {
    final value = _permissions;
    if (value == null) return null;
    if (_permissions is EqualUnmodifiableListView) return _permissions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @HiveField(5)
  final String? phoneNumber;
  @override
  @HiveField(6)
  final DateTime? createdAt;

  @override
  String toString() {
    return 'AdminModel(id: $id, name: $name, email: $email, isSuperAdmin: $isSuperAdmin, permissions: $permissions, phoneNumber: $phoneNumber, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.isSuperAdmin, isSuperAdmin) ||
                other.isSuperAdmin == isSuperAdmin) &&
            const DeepCollectionEquality()
                .equals(other._permissions, _permissions) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      email,
      isSuperAdmin,
      const DeepCollectionEquality().hash(_permissions),
      phoneNumber,
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminModelImplCopyWith<_$AdminModelImpl> get copyWith =>
      __$$AdminModelImplCopyWithImpl<_$AdminModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdminModelImplToJson(
      this,
    );
  }
}

abstract class _AdminModel implements AdminModel {
  const factory _AdminModel(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String name,
      @HiveField(2) required final String email,
      @HiveField(3) required final bool isSuperAdmin,
      @HiveField(4) final List<String>? permissions,
      @HiveField(5) final String? phoneNumber,
      @HiveField(6) final DateTime? createdAt}) = _$AdminModelImpl;

  factory _AdminModel.fromJson(Map<String, dynamic> json) =
      _$AdminModelImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get name;
  @override
  @HiveField(2)
  String get email;
  @override
  @HiveField(3)
  bool get isSuperAdmin;
  @override
  @HiveField(4)
  List<String>? get permissions;
  @override
  @HiveField(5)
  String? get phoneNumber;
  @override
  @HiveField(6)
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$AdminModelImplCopyWith<_$AdminModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
