// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CalendarState {
  Map<DateTime, CalendarMonthModel>? get page =>
      throw _privateConstructorUsedError;
  Map<DateTime, ELoadingStatus>? get status =>
      throw _privateConstructorUsedError;
  Map<DateTime, String>? get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CalendarStateCopyWith<CalendarState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarStateCopyWith<$Res> {
  factory $CalendarStateCopyWith(
          CalendarState value, $Res Function(CalendarState) then) =
      _$CalendarStateCopyWithImpl<$Res, CalendarState>;
  @useResult
  $Res call(
      {Map<DateTime, CalendarMonthModel>? page,
      Map<DateTime, ELoadingStatus>? status,
      Map<DateTime, String>? message});
}

/// @nodoc
class _$CalendarStateCopyWithImpl<$Res, $Val extends CalendarState>
    implements $CalendarStateCopyWith<$Res> {
  _$CalendarStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
    Object? status = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as Map<DateTime, CalendarMonthModel>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Map<DateTime, ELoadingStatus>?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as Map<DateTime, String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CalendarStateImplCopyWith<$Res>
    implements $CalendarStateCopyWith<$Res> {
  factory _$$CalendarStateImplCopyWith(
          _$CalendarStateImpl value, $Res Function(_$CalendarStateImpl) then) =
      __$$CalendarStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<DateTime, CalendarMonthModel>? page,
      Map<DateTime, ELoadingStatus>? status,
      Map<DateTime, String>? message});
}

/// @nodoc
class __$$CalendarStateImplCopyWithImpl<$Res>
    extends _$CalendarStateCopyWithImpl<$Res, _$CalendarStateImpl>
    implements _$$CalendarStateImplCopyWith<$Res> {
  __$$CalendarStateImplCopyWithImpl(
      _$CalendarStateImpl _value, $Res Function(_$CalendarStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
    Object? status = freezed,
    Object? message = freezed,
  }) {
    return _then(_$CalendarStateImpl(
      page: freezed == page
          ? _value._page
          : page // ignore: cast_nullable_to_non_nullable
              as Map<DateTime, CalendarMonthModel>?,
      status: freezed == status
          ? _value._status
          : status // ignore: cast_nullable_to_non_nullable
              as Map<DateTime, ELoadingStatus>?,
      message: freezed == message
          ? _value._message
          : message // ignore: cast_nullable_to_non_nullable
              as Map<DateTime, String>?,
    ));
  }
}

/// @nodoc

class _$CalendarStateImpl implements _CalendarState {
  _$CalendarStateImpl(
      {final Map<DateTime, CalendarMonthModel>? page,
      final Map<DateTime, ELoadingStatus>? status,
      final Map<DateTime, String>? message})
      : _page = page,
        _status = status,
        _message = message;

  final Map<DateTime, CalendarMonthModel>? _page;
  @override
  Map<DateTime, CalendarMonthModel>? get page {
    final value = _page;
    if (value == null) return null;
    if (_page is EqualUnmodifiableMapView) return _page;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<DateTime, ELoadingStatus>? _status;
  @override
  Map<DateTime, ELoadingStatus>? get status {
    final value = _status;
    if (value == null) return null;
    if (_status is EqualUnmodifiableMapView) return _status;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<DateTime, String>? _message;
  @override
  Map<DateTime, String>? get message {
    final value = _message;
    if (value == null) return null;
    if (_message is EqualUnmodifiableMapView) return _message;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'CalendarState(page: $page, status: $status, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalendarStateImpl &&
            const DeepCollectionEquality().equals(other._page, _page) &&
            const DeepCollectionEquality().equals(other._status, _status) &&
            const DeepCollectionEquality().equals(other._message, _message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_page),
      const DeepCollectionEquality().hash(_status),
      const DeepCollectionEquality().hash(_message));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CalendarStateImplCopyWith<_$CalendarStateImpl> get copyWith =>
      __$$CalendarStateImplCopyWithImpl<_$CalendarStateImpl>(this, _$identity);
}

abstract class _CalendarState implements CalendarState {
  factory _CalendarState(
      {final Map<DateTime, CalendarMonthModel>? page,
      final Map<DateTime, ELoadingStatus>? status,
      final Map<DateTime, String>? message}) = _$CalendarStateImpl;

  @override
  Map<DateTime, CalendarMonthModel>? get page;
  @override
  Map<DateTime, ELoadingStatus>? get status;
  @override
  Map<DateTime, String>? get message;
  @override
  @JsonKey(ignore: true)
  _$$CalendarStateImplCopyWith<_$CalendarStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CalendarMonthModel {
  Map<DateTime, DiaryModel>? get diaries => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CalendarMonthModelCopyWith<CalendarMonthModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarMonthModelCopyWith<$Res> {
  factory $CalendarMonthModelCopyWith(
          CalendarMonthModel value, $Res Function(CalendarMonthModel) then) =
      _$CalendarMonthModelCopyWithImpl<$Res, CalendarMonthModel>;
  @useResult
  $Res call({Map<DateTime, DiaryModel>? diaries});
}

/// @nodoc
class _$CalendarMonthModelCopyWithImpl<$Res, $Val extends CalendarMonthModel>
    implements $CalendarMonthModelCopyWith<$Res> {
  _$CalendarMonthModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? diaries = freezed,
  }) {
    return _then(_value.copyWith(
      diaries: freezed == diaries
          ? _value.diaries
          : diaries // ignore: cast_nullable_to_non_nullable
              as Map<DateTime, DiaryModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CalendarMonthModelImplCopyWith<$Res>
    implements $CalendarMonthModelCopyWith<$Res> {
  factory _$$CalendarMonthModelImplCopyWith(_$CalendarMonthModelImpl value,
          $Res Function(_$CalendarMonthModelImpl) then) =
      __$$CalendarMonthModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<DateTime, DiaryModel>? diaries});
}

/// @nodoc
class __$$CalendarMonthModelImplCopyWithImpl<$Res>
    extends _$CalendarMonthModelCopyWithImpl<$Res, _$CalendarMonthModelImpl>
    implements _$$CalendarMonthModelImplCopyWith<$Res> {
  __$$CalendarMonthModelImplCopyWithImpl(_$CalendarMonthModelImpl _value,
      $Res Function(_$CalendarMonthModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? diaries = freezed,
  }) {
    return _then(_$CalendarMonthModelImpl(
      diaries: freezed == diaries
          ? _value._diaries
          : diaries // ignore: cast_nullable_to_non_nullable
              as Map<DateTime, DiaryModel>?,
    ));
  }
}

/// @nodoc

class _$CalendarMonthModelImpl implements _CalendarMonthModel {
  _$CalendarMonthModelImpl({final Map<DateTime, DiaryModel>? diaries})
      : _diaries = diaries;

  final Map<DateTime, DiaryModel>? _diaries;
  @override
  Map<DateTime, DiaryModel>? get diaries {
    final value = _diaries;
    if (value == null) return null;
    if (_diaries is EqualUnmodifiableMapView) return _diaries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'CalendarMonthModel(diaries: $diaries)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalendarMonthModelImpl &&
            const DeepCollectionEquality().equals(other._diaries, _diaries));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_diaries));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CalendarMonthModelImplCopyWith<_$CalendarMonthModelImpl> get copyWith =>
      __$$CalendarMonthModelImplCopyWithImpl<_$CalendarMonthModelImpl>(
          this, _$identity);
}

abstract class _CalendarMonthModel implements CalendarMonthModel {
  factory _CalendarMonthModel({final Map<DateTime, DiaryModel>? diaries}) =
      _$CalendarMonthModelImpl;

  @override
  Map<DateTime, DiaryModel>? get diaries;
  @override
  @JsonKey(ignore: true)
  _$$CalendarMonthModelImplCopyWith<_$CalendarMonthModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
