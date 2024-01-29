// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'essay_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EssayModel _$EssayModelFromJson(Map<String, dynamic> json) {
  return _EssayModel.fromJson(json);
}

/// @nodoc
mixin _$EssayModel {
  @JsonKey(name: 'essayid')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'etitle')
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'econtent')
  String? get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'etime')
  DateTime? get time => throw _privateConstructorUsedError;
  @JsonKey(name: 'elikes')
  int? get likes => throw _privateConstructorUsedError;
  @JsonKey(name: 'ecategory')
  EEssayCategory? get category => throw _privateConstructorUsedError;
  String? get nickname => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EssayModelCopyWith<EssayModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EssayModelCopyWith<$Res> {
  factory $EssayModelCopyWith(
          EssayModel value, $Res Function(EssayModel) then) =
      _$EssayModelCopyWithImpl<$Res, EssayModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'essayid') int? id,
      @JsonKey(name: 'etitle') String? title,
      @JsonKey(name: 'econtent') String? content,
      @JsonKey(name: 'etime') DateTime? time,
      @JsonKey(name: 'elikes') int? likes,
      @JsonKey(name: 'ecategory') EEssayCategory? category,
      String? nickname});
}

/// @nodoc
class _$EssayModelCopyWithImpl<$Res, $Val extends EssayModel>
    implements $EssayModelCopyWith<$Res> {
  _$EssayModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? content = freezed,
    Object? time = freezed,
    Object? likes = freezed,
    Object? category = freezed,
    Object? nickname = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      likes: freezed == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as EEssayCategory?,
      nickname: freezed == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EssayModelImplCopyWith<$Res>
    implements $EssayModelCopyWith<$Res> {
  factory _$$EssayModelImplCopyWith(
          _$EssayModelImpl value, $Res Function(_$EssayModelImpl) then) =
      __$$EssayModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'essayid') int? id,
      @JsonKey(name: 'etitle') String? title,
      @JsonKey(name: 'econtent') String? content,
      @JsonKey(name: 'etime') DateTime? time,
      @JsonKey(name: 'elikes') int? likes,
      @JsonKey(name: 'ecategory') EEssayCategory? category,
      String? nickname});
}

/// @nodoc
class __$$EssayModelImplCopyWithImpl<$Res>
    extends _$EssayModelCopyWithImpl<$Res, _$EssayModelImpl>
    implements _$$EssayModelImplCopyWith<$Res> {
  __$$EssayModelImplCopyWithImpl(
      _$EssayModelImpl _value, $Res Function(_$EssayModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? content = freezed,
    Object? time = freezed,
    Object? likes = freezed,
    Object? category = freezed,
    Object? nickname = freezed,
  }) {
    return _then(_$EssayModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      likes: freezed == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as EEssayCategory?,
      nickname: freezed == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EssayModelImpl implements _EssayModel {
  _$EssayModelImpl(
      {@JsonKey(name: 'essayid') this.id,
      @JsonKey(name: 'etitle') this.title,
      @JsonKey(name: 'econtent') this.content,
      @JsonKey(name: 'etime') this.time,
      @JsonKey(name: 'elikes') this.likes,
      @JsonKey(name: 'ecategory') this.category,
      this.nickname});

  factory _$EssayModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EssayModelImplFromJson(json);

  @override
  @JsonKey(name: 'essayid')
  final int? id;
  @override
  @JsonKey(name: 'etitle')
  final String? title;
  @override
  @JsonKey(name: 'econtent')
  final String? content;
  @override
  @JsonKey(name: 'etime')
  final DateTime? time;
  @override
  @JsonKey(name: 'elikes')
  final int? likes;
  @override
  @JsonKey(name: 'ecategory')
  final EEssayCategory? category;
  @override
  final String? nickname;

  @override
  String toString() {
    return 'EssayModel(id: $id, title: $title, content: $content, time: $time, likes: $likes, category: $category, nickname: $nickname)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EssayModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.likes, likes) || other.likes == likes) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, content, time, likes, category, nickname);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EssayModelImplCopyWith<_$EssayModelImpl> get copyWith =>
      __$$EssayModelImplCopyWithImpl<_$EssayModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EssayModelImplToJson(
      this,
    );
  }
}

abstract class _EssayModel implements EssayModel {
  factory _EssayModel(
      {@JsonKey(name: 'essayid') final int? id,
      @JsonKey(name: 'etitle') final String? title,
      @JsonKey(name: 'econtent') final String? content,
      @JsonKey(name: 'etime') final DateTime? time,
      @JsonKey(name: 'elikes') final int? likes,
      @JsonKey(name: 'ecategory') final EEssayCategory? category,
      final String? nickname}) = _$EssayModelImpl;

  factory _EssayModel.fromJson(Map<String, dynamic> json) =
      _$EssayModelImpl.fromJson;

  @override
  @JsonKey(name: 'essayid')
  int? get id;
  @override
  @JsonKey(name: 'etitle')
  String? get title;
  @override
  @JsonKey(name: 'econtent')
  String? get content;
  @override
  @JsonKey(name: 'etime')
  DateTime? get time;
  @override
  @JsonKey(name: 'elikes')
  int? get likes;
  @override
  @JsonKey(name: 'ecategory')
  EEssayCategory? get category;
  @override
  String? get nickname;
  @override
  @JsonKey(ignore: true)
  _$$EssayModelImplCopyWith<_$EssayModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
