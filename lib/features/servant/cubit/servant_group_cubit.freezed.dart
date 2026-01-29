// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'servant_group_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ServantGroupState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ServantModel servant, List<StudentModel> students,
            Map<String, bool> todayAttendance)
        loaded,
    required TResult Function(String message) error,
    required TResult Function() attendanceSaved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ServantModel servant, List<StudentModel> students,
            Map<String, bool> todayAttendance)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function()? attendanceSaved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ServantModel servant, List<StudentModel> students,
            Map<String, bool> todayAttendance)?
        loaded,
    TResult Function(String message)? error,
    TResult Function()? attendanceSaved,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_AttendanceSaved value) attendanceSaved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_AttendanceSaved value)? attendanceSaved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_AttendanceSaved value)? attendanceSaved,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServantGroupStateCopyWith<$Res> {
  factory $ServantGroupStateCopyWith(
          ServantGroupState value, $Res Function(ServantGroupState) then) =
      _$ServantGroupStateCopyWithImpl<$Res, ServantGroupState>;
}

/// @nodoc
class _$ServantGroupStateCopyWithImpl<$Res, $Val extends ServantGroupState>
    implements $ServantGroupStateCopyWith<$Res> {
  _$ServantGroupStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ServantGroupStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ServantGroupState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ServantModel servant, List<StudentModel> students,
            Map<String, bool> todayAttendance)
        loaded,
    required TResult Function(String message) error,
    required TResult Function() attendanceSaved,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ServantModel servant, List<StudentModel> students,
            Map<String, bool> todayAttendance)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function()? attendanceSaved,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ServantModel servant, List<StudentModel> students,
            Map<String, bool> todayAttendance)?
        loaded,
    TResult Function(String message)? error,
    TResult Function()? attendanceSaved,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_AttendanceSaved value) attendanceSaved,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_AttendanceSaved value)? attendanceSaved,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_AttendanceSaved value)? attendanceSaved,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ServantGroupState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$ServantGroupStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'ServantGroupState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ServantModel servant, List<StudentModel> students,
            Map<String, bool> todayAttendance)
        loaded,
    required TResult Function(String message) error,
    required TResult Function() attendanceSaved,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ServantModel servant, List<StudentModel> students,
            Map<String, bool> todayAttendance)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function()? attendanceSaved,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ServantModel servant, List<StudentModel> students,
            Map<String, bool> todayAttendance)?
        loaded,
    TResult Function(String message)? error,
    TResult Function()? attendanceSaved,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_AttendanceSaved value) attendanceSaved,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_AttendanceSaved value)? attendanceSaved,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_AttendanceSaved value)? attendanceSaved,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements ServantGroupState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {ServantModel servant,
      List<StudentModel> students,
      Map<String, bool> todayAttendance});

  $ServantModelCopyWith<$Res> get servant;
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$ServantGroupStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? servant = null,
    Object? students = null,
    Object? todayAttendance = null,
  }) {
    return _then(_$LoadedImpl(
      servant: null == servant
          ? _value.servant
          : servant // ignore: cast_nullable_to_non_nullable
              as ServantModel,
      students: null == students
          ? _value._students
          : students // ignore: cast_nullable_to_non_nullable
              as List<StudentModel>,
      todayAttendance: null == todayAttendance
          ? _value._todayAttendance
          : todayAttendance // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ServantModelCopyWith<$Res> get servant {
    return $ServantModelCopyWith<$Res>(_value.servant, (value) {
      return _then(_value.copyWith(servant: value));
    });
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(
      {required this.servant,
      required final List<StudentModel> students,
      required final Map<String, bool> todayAttendance})
      : _students = students,
        _todayAttendance = todayAttendance;

  @override
  final ServantModel servant;
  final List<StudentModel> _students;
  @override
  List<StudentModel> get students {
    if (_students is EqualUnmodifiableListView) return _students;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_students);
  }

  final Map<String, bool> _todayAttendance;
  @override
  Map<String, bool> get todayAttendance {
    if (_todayAttendance is EqualUnmodifiableMapView) return _todayAttendance;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_todayAttendance);
  }

  @override
  String toString() {
    return 'ServantGroupState.loaded(servant: $servant, students: $students, todayAttendance: $todayAttendance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            (identical(other.servant, servant) || other.servant == servant) &&
            const DeepCollectionEquality().equals(other._students, _students) &&
            const DeepCollectionEquality()
                .equals(other._todayAttendance, _todayAttendance));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      servant,
      const DeepCollectionEquality().hash(_students),
      const DeepCollectionEquality().hash(_todayAttendance));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ServantModel servant, List<StudentModel> students,
            Map<String, bool> todayAttendance)
        loaded,
    required TResult Function(String message) error,
    required TResult Function() attendanceSaved,
  }) {
    return loaded(servant, students, todayAttendance);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ServantModel servant, List<StudentModel> students,
            Map<String, bool> todayAttendance)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function()? attendanceSaved,
  }) {
    return loaded?.call(servant, students, todayAttendance);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ServantModel servant, List<StudentModel> students,
            Map<String, bool> todayAttendance)?
        loaded,
    TResult Function(String message)? error,
    TResult Function()? attendanceSaved,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(servant, students, todayAttendance);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_AttendanceSaved value) attendanceSaved,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_AttendanceSaved value)? attendanceSaved,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_AttendanceSaved value)? attendanceSaved,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements ServantGroupState {
  const factory _Loaded(
      {required final ServantModel servant,
      required final List<StudentModel> students,
      required final Map<String, bool> todayAttendance}) = _$LoadedImpl;

  ServantModel get servant;
  List<StudentModel> get students;
  Map<String, bool> get todayAttendance;
  @JsonKey(ignore: true)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$ServantGroupStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ServantGroupState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ServantModel servant, List<StudentModel> students,
            Map<String, bool> todayAttendance)
        loaded,
    required TResult Function(String message) error,
    required TResult Function() attendanceSaved,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ServantModel servant, List<StudentModel> students,
            Map<String, bool> todayAttendance)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function()? attendanceSaved,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ServantModel servant, List<StudentModel> students,
            Map<String, bool> todayAttendance)?
        loaded,
    TResult Function(String message)? error,
    TResult Function()? attendanceSaved,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_AttendanceSaved value) attendanceSaved,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_AttendanceSaved value)? attendanceSaved,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_AttendanceSaved value)? attendanceSaved,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements ServantGroupState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AttendanceSavedImplCopyWith<$Res> {
  factory _$$AttendanceSavedImplCopyWith(_$AttendanceSavedImpl value,
          $Res Function(_$AttendanceSavedImpl) then) =
      __$$AttendanceSavedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AttendanceSavedImplCopyWithImpl<$Res>
    extends _$ServantGroupStateCopyWithImpl<$Res, _$AttendanceSavedImpl>
    implements _$$AttendanceSavedImplCopyWith<$Res> {
  __$$AttendanceSavedImplCopyWithImpl(
      _$AttendanceSavedImpl _value, $Res Function(_$AttendanceSavedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AttendanceSavedImpl implements _AttendanceSaved {
  const _$AttendanceSavedImpl();

  @override
  String toString() {
    return 'ServantGroupState.attendanceSaved()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AttendanceSavedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ServantModel servant, List<StudentModel> students,
            Map<String, bool> todayAttendance)
        loaded,
    required TResult Function(String message) error,
    required TResult Function() attendanceSaved,
  }) {
    return attendanceSaved();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ServantModel servant, List<StudentModel> students,
            Map<String, bool> todayAttendance)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function()? attendanceSaved,
  }) {
    return attendanceSaved?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ServantModel servant, List<StudentModel> students,
            Map<String, bool> todayAttendance)?
        loaded,
    TResult Function(String message)? error,
    TResult Function()? attendanceSaved,
    required TResult orElse(),
  }) {
    if (attendanceSaved != null) {
      return attendanceSaved();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_AttendanceSaved value) attendanceSaved,
  }) {
    return attendanceSaved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_AttendanceSaved value)? attendanceSaved,
  }) {
    return attendanceSaved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_AttendanceSaved value)? attendanceSaved,
    required TResult orElse(),
  }) {
    if (attendanceSaved != null) {
      return attendanceSaved(this);
    }
    return orElse();
  }
}

abstract class _AttendanceSaved implements ServantGroupState {
  const factory _AttendanceSaved() = _$AttendanceSavedImpl;
}
