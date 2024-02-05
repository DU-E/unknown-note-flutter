// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DiaryModel _$DiaryModelFromJson(Map<String, dynamic> json) {
  return _DiaryModel.fromJson(json);
}

/// @nodoc
mixin _$DiaryModel {
  @JsonKey(name: 'diaryid')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'dcontent')
  String? get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'dtime')
  DateTime? get time => throw _privateConstructorUsedError;
  @JsonKey(name: 'dtag')
  EEmotion? get emotion => throw _privateConstructorUsedError;
  @JsonKey(name: 'userid')
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'openable', fromJson: openableFromJson, toJson: openableToJson)
  bool? get isOpen => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiaryModelCopyWith<DiaryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiaryModelCopyWith<$Res> {
  factory $DiaryModelCopyWith(
          DiaryModel value, $Res Function(DiaryModel) then) =
      _$DiaryModelCopyWithImpl<$Res, DiaryModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'diaryid') int? id,
      @JsonKey(name: 'dcontent') String? content,
      @JsonKey(name: 'dtime') DateTime? time,
      @JsonKey(name: 'dtag') EEmotion? emotion,
      @JsonKey(name: 'userid') int? userId,
      @JsonKey(
          name: 'openable', fromJson: openableFromJson, toJson: openableToJson)
      bool? isOpen});
}

/// @nodoc
class _$DiaryModelCopyWithImpl<$Res, $Val extends DiaryModel>
    implements $DiaryModelCopyWith<$Res> {
  _$DiaryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? content = freezed,
    Object? time = freezed,
    Object? emotion = freezed,
    Object? userId = freezed,
    Object? isOpen = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      emotion: freezed == emotion
          ? _value.emotion
          : emotion // ignore: cast_nullable_to_non_nullable
              as EEmotion?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      isOpen: freezed == isOpen
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DiaryModelImplCopyWith<$Res>
    implements $DiaryModelCopyWith<$Res> {
  factory _$$DiaryModelImplCopyWith(
          _$DiaryModelImpl value, $Res Function(_$DiaryModelImpl) then) =
      __$$DiaryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'diaryid') int? id,
      @JsonKey(name: 'dcontent') String? content,
      @JsonKey(name: 'dtime') DateTime? time,
      @JsonKey(name: 'dtag') EEmotion? emotion,
      @JsonKey(name: 'userid') int? userId,
      @JsonKey(
          name: 'openable', fromJson: openableFromJson, toJson: openableToJson)
      bool? isOpen});
}

/// @nodoc
class __$$DiaryModelImplCopyWithImpl<$Res>
    extends _$DiaryModelCopyWithImpl<$Res, _$DiaryModelImpl>
    implements _$$DiaryModelImplCopyWith<$Res> {
  __$$DiaryModelImplCopyWithImpl(
      _$DiaryModelImpl _value, $Res Function(_$DiaryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? content = freezed,
    Object? time = freezed,
    Object? emotion = freezed,
    Object? userId = freezed,
    Object? isOpen = freezed,
  }) {
    return _then(_$DiaryModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      emotion: freezed == emotion
          ? _value.emotion
          : emotion // ignore: cast_nullable_to_non_nullable
              as EEmotion?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      isOpen: freezed == isOpen
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DiaryModelImpl implements _DiaryModel {
  _$DiaryModelImpl(
      {@JsonKey(name: 'diaryid') this.id,
      @JsonKey(name: 'dcontent') this.content,
      @JsonKey(name: 'dtime') this.time,
      @JsonKey(name: 'dtag') this.emotion,
      @JsonKey(name: 'userid') this.userId,
      @JsonKey(
          name: 'openable', fromJson: openableFromJson, toJson: openableToJson)
      this.isOpen});

  factory _$DiaryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiaryModelImplFromJson(json);

  @override
  @JsonKey(name: 'diaryid')
  final int? id;
  @override
  @JsonKey(name: 'dcontent')
  final String? content;
  @override
  @JsonKey(name: 'dtime')
  final DateTime? time;
  @override
  @JsonKey(name: 'dtag')
  final EEmotion? emotion;
  @override
  @JsonKey(name: 'userid')
  final int? userId;
  @override
  @JsonKey(name: 'openable', fromJson: openableFromJson, toJson: openableToJson)
  final bool? isOpen;

  @override
  String toString() {
    return 'DiaryModel(id: $id, content: $content, time: $time, emotion: $emotion, userId: $userId, isOpen: $isOpen)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiaryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.emotion, emotion) || other.emotion == emotion) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.isOpen, isOpen) || other.isOpen == isOpen));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, content, time, emotion, userId, isOpen);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DiaryModelImplCopyWith<_$DiaryModelImpl> get copyWith =>
      __$$DiaryModelImplCopyWithImpl<_$DiaryModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DiaryModelImplToJson(
      this,
    );
  }
}

abstract class _DiaryModel implements DiaryModel {
  factory _DiaryModel(
      {@JsonKey(name: 'diaryid') final int? id,
      @JsonKey(name: 'dcontent') final String? content,
      @JsonKey(name: 'dtime') final DateTime? time,
      @JsonKey(name: 'dtag') final EEmotion? emotion,
      @JsonKey(name: 'userid') final int? userId,
      @JsonKey(
          name: 'openable', fromJson: openableFromJson, toJson: openableToJson)
      final bool? isOpen}) = _$DiaryModelImpl;

  factory _DiaryModel.fromJson(Map<String, dynamic> json) =
      _$DiaryModelImpl.fromJson;

  @override
  @JsonKey(name: 'diaryid')
  int? get id;
  @override
  @JsonKey(name: 'dcontent')
  String? get content;
  @override
  @JsonKey(name: 'dtime')
  DateTime? get time;
  @override
  @JsonKey(name: 'dtag')
  EEmotion? get emotion;
  @override
  @JsonKey(name: 'userid')
  int? get userId;
  @override
  @JsonKey(name: 'openable', fromJson: openableFromJson, toJson: openableToJson)
  bool? get isOpen;
  @override
  @JsonKey(ignore: true)
  _$$DiaryModelImplCopyWith<_$DiaryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
