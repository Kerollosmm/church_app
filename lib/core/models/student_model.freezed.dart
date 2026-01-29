// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'student_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StudentModel _$StudentModelFromJson(Map<String, dynamic> json) {
  return _StudentModel.fromJson(json);
}

/// @nodoc
mixin _$StudentModel {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  String get grade => throw _privateConstructorUsedError;
  @HiveField(3)
  String get group => throw _privateConstructorUsedError;
  @HiveField(4)
  String get educationStage => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get studentPhone => throw _privateConstructorUsedError;
  @HiveField(6)
  List<String> get parentsPhones => throw _privateConstructorUsedError;
  @HiveField(7)
  String? get photoUrl => throw _privateConstructorUsedError;
  @HiveField(8)
  int get totalPoints => throw _privateConstructorUsedError;
  @HiveField(9)
  int get totalAbsences => throw _privateConstructorUsedError;
  @HiveField(10)
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StudentModelCopyWith<StudentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentModelCopyWith<$Res> {
  factory $StudentModelCopyWith(
          StudentModel value, $Res Function(StudentModel) then) =
      _$StudentModelCopyWithImpl<$Res, StudentModel>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) String grade,
      @HiveField(3) String group,
      @HiveField(4) String educationStage,
      @HiveField(5) String? studentPhone,
      @HiveField(6) List<String> parentsPhones,
      @HiveField(7) String? photoUrl,
      @HiveField(8) int totalPoints,
      @HiveField(9) int totalAbsences,
      @HiveField(10) DateTime? createdAt});
}

/// @nodoc
class _$StudentModelCopyWithImpl<$Res, $Val extends StudentModel>
    implements $StudentModelCopyWith<$Res> {
  _$StudentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? grade = null,
    Object? group = null,
    Object? educationStage = null,
    Object? studentPhone = freezed,
    Object? parentsPhones = null,
    Object? photoUrl = freezed,
    Object? totalPoints = null,
    Object? totalAbsences = null,
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
      grade: null == grade
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as String,
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as String,
      educationStage: null == educationStage
          ? _value.educationStage
          : educationStage // ignore: cast_nullable_to_non_nullable
              as String,
      studentPhone: freezed == studentPhone
          ? _value.studentPhone
          : studentPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      parentsPhones: null == parentsPhones
          ? _value.parentsPhones
          : parentsPhones // ignore: cast_nullable_to_non_nullable
              as List<String>,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      totalPoints: null == totalPoints
          ? _value.totalPoints
          : totalPoints // ignore: cast_nullable_to_non_nullable
              as int,
      totalAbsences: null == totalAbsences
          ? _value.totalAbsences
          : totalAbsences // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StudentModelImplCopyWith<$Res>
    implements $StudentModelCopyWith<$Res> {
  factory _$$StudentModelImplCopyWith(
          _$StudentModelImpl value, $Res Function(_$StudentModelImpl) then) =
      __$$StudentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) String grade,
      @HiveField(3) String group,
      @HiveField(4) String educationStage,
      @HiveField(5) String? studentPhone,
      @HiveField(6) List<String> parentsPhones,
      @HiveField(7) String? photoUrl,
      @HiveField(8) int totalPoints,
      @HiveField(9) int totalAbsences,
      @HiveField(10) DateTime? createdAt});
}

/// @nodoc
class __$$StudentModelImplCopyWithImpl<$Res>
    extends _$StudentModelCopyWithImpl<$Res, _$StudentModelImpl>
    implements _$$StudentModelImplCopyWith<$Res> {
  __$$StudentModelImplCopyWithImpl(
      _$StudentModelImpl _value, $Res Function(_$StudentModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? grade = null,
    Object? group = null,
    Object? educationStage = null,
    Object? studentPhone = freezed,
    Object? parentsPhones = null,
    Object? photoUrl = freezed,
    Object? totalPoints = null,
    Object? totalAbsences = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$StudentModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      grade: null == grade
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as String,
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as String,
      educationStage: null == educationStage
          ? _value.educationStage
          : educationStage // ignore: cast_nullable_to_non_nullable
              as String,
      studentPhone: freezed == studentPhone
          ? _value.studentPhone
          : studentPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      parentsPhones: null == parentsPhones
          ? _value._parentsPhones
          : parentsPhones // ignore: cast_nullable_to_non_nullable
              as List<String>,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      totalPoints: null == totalPoints
          ? _value.totalPoints
          : totalPoints // ignore: cast_nullable_to_non_nullable
              as int,
      totalAbsences: null == totalAbsences
          ? _value.totalAbsences
          : totalAbsences // ignore: cast_nullable_to_non_nullable
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
class _$StudentModelImpl implements _StudentModel {
  const _$StudentModelImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.name,
      @HiveField(2) required this.grade,
      @HiveField(3) required this.group,
      @HiveField(4) required this.educationStage,
      @HiveField(5) this.studentPhone,
      @HiveField(6) required final List<String> parentsPhones,
      @HiveField(7) this.photoUrl,
      @HiveField(8) this.totalPoints = 0,
      @HiveField(9) this.totalAbsences = 0,
      @HiveField(10) this.createdAt})
      : _parentsPhones = parentsPhones;

  factory _$StudentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudentModelImplFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String name;
  @override
  @HiveField(2)
  final String grade;
  @override
  @HiveField(3)
  final String group;
  @override
  @HiveField(4)
  final String educationStage;
  @override
  @HiveField(5)
  final String? studentPhone;
  final List<String> _parentsPhones;
  @override
  @HiveField(6)
  List<String> get parentsPhones {
    if (_parentsPhones is EqualUnmodifiableListView) return _parentsPhones;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_parentsPhones);
  }

  @override
  @HiveField(7)
  final String? photoUrl;
  @override
  @JsonKey()
  @HiveField(8)
  final int totalPoints;
  @override
  @JsonKey()
  @HiveField(9)
  final int totalAbsences;
  @override
  @HiveField(10)
  final DateTime? createdAt;

  @override
  String toString() {
    return 'StudentModel(id: $id, name: $name, grade: $grade, group: $group, educationStage: $educationStage, studentPhone: $studentPhone, parentsPhones: $parentsPhones, photoUrl: $photoUrl, totalPoints: $totalPoints, totalAbsences: $totalAbsences, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.grade, grade) || other.grade == grade) &&
            (identical(other.group, group) || other.group == group) &&
            (identical(other.educationStage, educationStage) ||
                other.educationStage == educationStage) &&
            (identical(other.studentPhone, studentPhone) ||
                other.studentPhone == studentPhone) &&
            const DeepCollectionEquality()
                .equals(other._parentsPhones, _parentsPhones) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.totalPoints, totalPoints) ||
                other.totalPoints == totalPoints) &&
            (identical(other.totalAbsences, totalAbsences) ||
                other.totalAbsences == totalAbsences) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      grade,
      group,
      educationStage,
      studentPhone,
      const DeepCollectionEquality().hash(_parentsPhones),
      photoUrl,
      totalPoints,
      totalAbsences,
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentModelImplCopyWith<_$StudentModelImpl> get copyWith =>
      __$$StudentModelImplCopyWithImpl<_$StudentModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StudentModelImplToJson(
      this,
    );
  }
}

abstract class _StudentModel implements StudentModel {
  const factory _StudentModel(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String name,
      @HiveField(2) required final String grade,
      @HiveField(3) required final String group,
      @HiveField(4) required final String educationStage,
      @HiveField(5) final String? studentPhone,
      @HiveField(6) required final List<String> parentsPhones,
      @HiveField(7) final String? photoUrl,
      @HiveField(8) final int totalPoints,
      @HiveField(9) final int totalAbsences,
      @HiveField(10) final DateTime? createdAt}) = _$StudentModelImpl;

  factory _StudentModel.fromJson(Map<String, dynamic> json) =
      _$StudentModelImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get name;
  @override
  @HiveField(2)
  String get grade;
  @override
  @HiveField(3)
  String get group;
  @override
  @HiveField(4)
  String get educationStage;
  @override
  @HiveField(5)
  String? get studentPhone;
  @override
  @HiveField(6)
  List<String> get parentsPhones;
  @override
  @HiveField(7)
  String? get photoUrl;
  @override
  @HiveField(8)
  int get totalPoints;
  @override
  @HiveField(9)
  int get totalAbsences;
  @override
  @HiveField(10)
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$StudentModelImplCopyWith<_$StudentModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
