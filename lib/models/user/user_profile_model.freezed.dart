// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserProfileModel _$UserProfileModelFromJson(Map<String, dynamic> json) {
  return _UserProfileModel.fromJson(json);
}

/// @nodoc
mixin _$UserProfileModel {
  UserModel? get user => throw _privateConstructorUsedError;
  @JsonKey(name: 'essay_cnt')
  int? get essayCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'journal_cnt')
  int? get diaryCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'recent_graph')
  List<UserStatsDataModel>? get recentGraph =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'monthly_act')
  List<UserStatsDataModel>? get monthlyAct =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'monthly_emo')
  UserMonthlyEmotionModel? get monthlyEmotions =>
      throw _privateConstructorUsedError;
  EEmotion? get flower => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserProfileModelCopyWith<UserProfileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileModelCopyWith<$Res> {
  factory $UserProfileModelCopyWith(
          UserProfileModel value, $Res Function(UserProfileModel) then) =
      _$UserProfileModelCopyWithImpl<$Res, UserProfileModel>;
  @useResult
  $Res call(
      {UserModel? user,
      @JsonKey(name: 'essay_cnt') int? essayCount,
      @JsonKey(name: 'journal_cnt') int? diaryCount,
      @JsonKey(name: 'recent_graph') List<UserStatsDataModel>? recentGraph,
      @JsonKey(name: 'monthly_act') List<UserStatsDataModel>? monthlyAct,
      @JsonKey(name: 'monthly_emo') UserMonthlyEmotionModel? monthlyEmotions,
      EEmotion? flower});

  $UserModelCopyWith<$Res>? get user;
  $UserMonthlyEmotionModelCopyWith<$Res>? get monthlyEmotions;
}

/// @nodoc
class _$UserProfileModelCopyWithImpl<$Res, $Val extends UserProfileModel>
    implements $UserProfileModelCopyWith<$Res> {
  _$UserProfileModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? essayCount = freezed,
    Object? diaryCount = freezed,
    Object? recentGraph = freezed,
    Object? monthlyAct = freezed,
    Object? monthlyEmotions = freezed,
    Object? flower = freezed,
  }) {
    return _then(_value.copyWith(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      essayCount: freezed == essayCount
          ? _value.essayCount
          : essayCount // ignore: cast_nullable_to_non_nullable
              as int?,
      diaryCount: freezed == diaryCount
          ? _value.diaryCount
          : diaryCount // ignore: cast_nullable_to_non_nullable
              as int?,
      recentGraph: freezed == recentGraph
          ? _value.recentGraph
          : recentGraph // ignore: cast_nullable_to_non_nullable
              as List<UserStatsDataModel>?,
      monthlyAct: freezed == monthlyAct
          ? _value.monthlyAct
          : monthlyAct // ignore: cast_nullable_to_non_nullable
              as List<UserStatsDataModel>?,
      monthlyEmotions: freezed == monthlyEmotions
          ? _value.monthlyEmotions
          : monthlyEmotions // ignore: cast_nullable_to_non_nullable
              as UserMonthlyEmotionModel?,
      flower: freezed == flower
          ? _value.flower
          : flower // ignore: cast_nullable_to_non_nullable
              as EEmotion?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserMonthlyEmotionModelCopyWith<$Res>? get monthlyEmotions {
    if (_value.monthlyEmotions == null) {
      return null;
    }

    return $UserMonthlyEmotionModelCopyWith<$Res>(_value.monthlyEmotions!,
        (value) {
      return _then(_value.copyWith(monthlyEmotions: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserProfileModelImplCopyWith<$Res>
    implements $UserProfileModelCopyWith<$Res> {
  factory _$$UserProfileModelImplCopyWith(_$UserProfileModelImpl value,
          $Res Function(_$UserProfileModelImpl) then) =
      __$$UserProfileModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UserModel? user,
      @JsonKey(name: 'essay_cnt') int? essayCount,
      @JsonKey(name: 'journal_cnt') int? diaryCount,
      @JsonKey(name: 'recent_graph') List<UserStatsDataModel>? recentGraph,
      @JsonKey(name: 'monthly_act') List<UserStatsDataModel>? monthlyAct,
      @JsonKey(name: 'monthly_emo') UserMonthlyEmotionModel? monthlyEmotions,
      EEmotion? flower});

  @override
  $UserModelCopyWith<$Res>? get user;
  @override
  $UserMonthlyEmotionModelCopyWith<$Res>? get monthlyEmotions;
}

/// @nodoc
class __$$UserProfileModelImplCopyWithImpl<$Res>
    extends _$UserProfileModelCopyWithImpl<$Res, _$UserProfileModelImpl>
    implements _$$UserProfileModelImplCopyWith<$Res> {
  __$$UserProfileModelImplCopyWithImpl(_$UserProfileModelImpl _value,
      $Res Function(_$UserProfileModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? essayCount = freezed,
    Object? diaryCount = freezed,
    Object? recentGraph = freezed,
    Object? monthlyAct = freezed,
    Object? monthlyEmotions = freezed,
    Object? flower = freezed,
  }) {
    return _then(_$UserProfileModelImpl(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      essayCount: freezed == essayCount
          ? _value.essayCount
          : essayCount // ignore: cast_nullable_to_non_nullable
              as int?,
      diaryCount: freezed == diaryCount
          ? _value.diaryCount
          : diaryCount // ignore: cast_nullable_to_non_nullable
              as int?,
      recentGraph: freezed == recentGraph
          ? _value._recentGraph
          : recentGraph // ignore: cast_nullable_to_non_nullable
              as List<UserStatsDataModel>?,
      monthlyAct: freezed == monthlyAct
          ? _value._monthlyAct
          : monthlyAct // ignore: cast_nullable_to_non_nullable
              as List<UserStatsDataModel>?,
      monthlyEmotions: freezed == monthlyEmotions
          ? _value.monthlyEmotions
          : monthlyEmotions // ignore: cast_nullable_to_non_nullable
              as UserMonthlyEmotionModel?,
      flower: freezed == flower
          ? _value.flower
          : flower // ignore: cast_nullable_to_non_nullable
              as EEmotion?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserProfileModelImpl implements _UserProfileModel {
  _$UserProfileModelImpl(
      {this.user,
      @JsonKey(name: 'essay_cnt') this.essayCount,
      @JsonKey(name: 'journal_cnt') this.diaryCount,
      @JsonKey(name: 'recent_graph')
      final List<UserStatsDataModel>? recentGraph,
      @JsonKey(name: 'monthly_act') final List<UserStatsDataModel>? monthlyAct,
      @JsonKey(name: 'monthly_emo') this.monthlyEmotions,
      this.flower})
      : _recentGraph = recentGraph,
        _monthlyAct = monthlyAct;

  factory _$UserProfileModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProfileModelImplFromJson(json);

  @override
  final UserModel? user;
  @override
  @JsonKey(name: 'essay_cnt')
  final int? essayCount;
  @override
  @JsonKey(name: 'journal_cnt')
  final int? diaryCount;
  final List<UserStatsDataModel>? _recentGraph;
  @override
  @JsonKey(name: 'recent_graph')
  List<UserStatsDataModel>? get recentGraph {
    final value = _recentGraph;
    if (value == null) return null;
    if (_recentGraph is EqualUnmodifiableListView) return _recentGraph;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<UserStatsDataModel>? _monthlyAct;
  @override
  @JsonKey(name: 'monthly_act')
  List<UserStatsDataModel>? get monthlyAct {
    final value = _monthlyAct;
    if (value == null) return null;
    if (_monthlyAct is EqualUnmodifiableListView) return _monthlyAct;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'monthly_emo')
  final UserMonthlyEmotionModel? monthlyEmotions;
  @override
  final EEmotion? flower;

  @override
  String toString() {
    return 'UserProfileModel(user: $user, essayCount: $essayCount, diaryCount: $diaryCount, recentGraph: $recentGraph, monthlyAct: $monthlyAct, monthlyEmotions: $monthlyEmotions, flower: $flower)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileModelImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.essayCount, essayCount) ||
                other.essayCount == essayCount) &&
            (identical(other.diaryCount, diaryCount) ||
                other.diaryCount == diaryCount) &&
            const DeepCollectionEquality()
                .equals(other._recentGraph, _recentGraph) &&
            const DeepCollectionEquality()
                .equals(other._monthlyAct, _monthlyAct) &&
            (identical(other.monthlyEmotions, monthlyEmotions) ||
                other.monthlyEmotions == monthlyEmotions) &&
            (identical(other.flower, flower) || other.flower == flower));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      user,
      essayCount,
      diaryCount,
      const DeepCollectionEquality().hash(_recentGraph),
      const DeepCollectionEquality().hash(_monthlyAct),
      monthlyEmotions,
      flower);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileModelImplCopyWith<_$UserProfileModelImpl> get copyWith =>
      __$$UserProfileModelImplCopyWithImpl<_$UserProfileModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProfileModelImplToJson(
      this,
    );
  }
}

abstract class _UserProfileModel implements UserProfileModel {
  factory _UserProfileModel(
      {final UserModel? user,
      @JsonKey(name: 'essay_cnt') final int? essayCount,
      @JsonKey(name: 'journal_cnt') final int? diaryCount,
      @JsonKey(name: 'recent_graph')
      final List<UserStatsDataModel>? recentGraph,
      @JsonKey(name: 'monthly_act') final List<UserStatsDataModel>? monthlyAct,
      @JsonKey(name: 'monthly_emo')
      final UserMonthlyEmotionModel? monthlyEmotions,
      final EEmotion? flower}) = _$UserProfileModelImpl;

  factory _UserProfileModel.fromJson(Map<String, dynamic> json) =
      _$UserProfileModelImpl.fromJson;

  @override
  UserModel? get user;
  @override
  @JsonKey(name: 'essay_cnt')
  int? get essayCount;
  @override
  @JsonKey(name: 'journal_cnt')
  int? get diaryCount;
  @override
  @JsonKey(name: 'recent_graph')
  List<UserStatsDataModel>? get recentGraph;
  @override
  @JsonKey(name: 'monthly_act')
  List<UserStatsDataModel>? get monthlyAct;
  @override
  @JsonKey(name: 'monthly_emo')
  UserMonthlyEmotionModel? get monthlyEmotions;
  @override
  EEmotion? get flower;
  @override
  @JsonKey(ignore: true)
  _$$UserProfileModelImplCopyWith<_$UserProfileModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserStatsDataModel _$UserStatsDataModelFromJson(Map<String, dynamic> json) {
  return _UserStatsDataModel.fromJson(json);
}

/// @nodoc
mixin _$UserStatsDataModel {
  DateTime? get date => throw _privateConstructorUsedError;
  num? get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserStatsDataModelCopyWith<UserStatsDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStatsDataModelCopyWith<$Res> {
  factory $UserStatsDataModelCopyWith(
          UserStatsDataModel value, $Res Function(UserStatsDataModel) then) =
      _$UserStatsDataModelCopyWithImpl<$Res, UserStatsDataModel>;
  @useResult
  $Res call({DateTime? date, num? value});
}

/// @nodoc
class _$UserStatsDataModelCopyWithImpl<$Res, $Val extends UserStatsDataModel>
    implements $UserStatsDataModelCopyWith<$Res> {
  _$UserStatsDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as num?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserStatsDataModelImplCopyWith<$Res>
    implements $UserStatsDataModelCopyWith<$Res> {
  factory _$$UserStatsDataModelImplCopyWith(_$UserStatsDataModelImpl value,
          $Res Function(_$UserStatsDataModelImpl) then) =
      __$$UserStatsDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime? date, num? value});
}

/// @nodoc
class __$$UserStatsDataModelImplCopyWithImpl<$Res>
    extends _$UserStatsDataModelCopyWithImpl<$Res, _$UserStatsDataModelImpl>
    implements _$$UserStatsDataModelImplCopyWith<$Res> {
  __$$UserStatsDataModelImplCopyWithImpl(_$UserStatsDataModelImpl _value,
      $Res Function(_$UserStatsDataModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? value = freezed,
  }) {
    return _then(_$UserStatsDataModelImpl(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as num?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserStatsDataModelImpl implements _UserStatsDataModel {
  _$UserStatsDataModelImpl({this.date, this.value});

  factory _$UserStatsDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserStatsDataModelImplFromJson(json);

  @override
  final DateTime? date;
  @override
  final num? value;

  @override
  String toString() {
    return 'UserStatsDataModel(date: $date, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStatsDataModelImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, date, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserStatsDataModelImplCopyWith<_$UserStatsDataModelImpl> get copyWith =>
      __$$UserStatsDataModelImplCopyWithImpl<_$UserStatsDataModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserStatsDataModelImplToJson(
      this,
    );
  }
}

abstract class _UserStatsDataModel implements UserStatsDataModel {
  factory _UserStatsDataModel({final DateTime? date, final num? value}) =
      _$UserStatsDataModelImpl;

  factory _UserStatsDataModel.fromJson(Map<String, dynamic> json) =
      _$UserStatsDataModelImpl.fromJson;

  @override
  DateTime? get date;
  @override
  num? get value;
  @override
  @JsonKey(ignore: true)
  _$$UserStatsDataModelImplCopyWith<_$UserStatsDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserMonthlyEmotionModel _$UserMonthlyEmotionModelFromJson(
    Map<String, dynamic> json) {
  return _UserMonthlyEmotionModel.fromJson(json);
}

/// @nodoc
mixin _$UserMonthlyEmotionModel {
  int? get happy => throw _privateConstructorUsedError;
  int? get love => throw _privateConstructorUsedError;
  int? get expect => throw _privateConstructorUsedError;
  int? get thanks => throw _privateConstructorUsedError;
  int? get sad => throw _privateConstructorUsedError;
  int? get rage => throw _privateConstructorUsedError;
  int? get fear => throw _privateConstructorUsedError;
  int? get regret => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserMonthlyEmotionModelCopyWith<UserMonthlyEmotionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserMonthlyEmotionModelCopyWith<$Res> {
  factory $UserMonthlyEmotionModelCopyWith(UserMonthlyEmotionModel value,
          $Res Function(UserMonthlyEmotionModel) then) =
      _$UserMonthlyEmotionModelCopyWithImpl<$Res, UserMonthlyEmotionModel>;
  @useResult
  $Res call(
      {int? happy,
      int? love,
      int? expect,
      int? thanks,
      int? sad,
      int? rage,
      int? fear,
      int? regret});
}

/// @nodoc
class _$UserMonthlyEmotionModelCopyWithImpl<$Res,
        $Val extends UserMonthlyEmotionModel>
    implements $UserMonthlyEmotionModelCopyWith<$Res> {
  _$UserMonthlyEmotionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? happy = freezed,
    Object? love = freezed,
    Object? expect = freezed,
    Object? thanks = freezed,
    Object? sad = freezed,
    Object? rage = freezed,
    Object? fear = freezed,
    Object? regret = freezed,
  }) {
    return _then(_value.copyWith(
      happy: freezed == happy
          ? _value.happy
          : happy // ignore: cast_nullable_to_non_nullable
              as int?,
      love: freezed == love
          ? _value.love
          : love // ignore: cast_nullable_to_non_nullable
              as int?,
      expect: freezed == expect
          ? _value.expect
          : expect // ignore: cast_nullable_to_non_nullable
              as int?,
      thanks: freezed == thanks
          ? _value.thanks
          : thanks // ignore: cast_nullable_to_non_nullable
              as int?,
      sad: freezed == sad
          ? _value.sad
          : sad // ignore: cast_nullable_to_non_nullable
              as int?,
      rage: freezed == rage
          ? _value.rage
          : rage // ignore: cast_nullable_to_non_nullable
              as int?,
      fear: freezed == fear
          ? _value.fear
          : fear // ignore: cast_nullable_to_non_nullable
              as int?,
      regret: freezed == regret
          ? _value.regret
          : regret // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserMonthlyEmotionModelImplCopyWith<$Res>
    implements $UserMonthlyEmotionModelCopyWith<$Res> {
  factory _$$UserMonthlyEmotionModelImplCopyWith(
          _$UserMonthlyEmotionModelImpl value,
          $Res Function(_$UserMonthlyEmotionModelImpl) then) =
      __$$UserMonthlyEmotionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? happy,
      int? love,
      int? expect,
      int? thanks,
      int? sad,
      int? rage,
      int? fear,
      int? regret});
}

/// @nodoc
class __$$UserMonthlyEmotionModelImplCopyWithImpl<$Res>
    extends _$UserMonthlyEmotionModelCopyWithImpl<$Res,
        _$UserMonthlyEmotionModelImpl>
    implements _$$UserMonthlyEmotionModelImplCopyWith<$Res> {
  __$$UserMonthlyEmotionModelImplCopyWithImpl(
      _$UserMonthlyEmotionModelImpl _value,
      $Res Function(_$UserMonthlyEmotionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? happy = freezed,
    Object? love = freezed,
    Object? expect = freezed,
    Object? thanks = freezed,
    Object? sad = freezed,
    Object? rage = freezed,
    Object? fear = freezed,
    Object? regret = freezed,
  }) {
    return _then(_$UserMonthlyEmotionModelImpl(
      happy: freezed == happy
          ? _value.happy
          : happy // ignore: cast_nullable_to_non_nullable
              as int?,
      love: freezed == love
          ? _value.love
          : love // ignore: cast_nullable_to_non_nullable
              as int?,
      expect: freezed == expect
          ? _value.expect
          : expect // ignore: cast_nullable_to_non_nullable
              as int?,
      thanks: freezed == thanks
          ? _value.thanks
          : thanks // ignore: cast_nullable_to_non_nullable
              as int?,
      sad: freezed == sad
          ? _value.sad
          : sad // ignore: cast_nullable_to_non_nullable
              as int?,
      rage: freezed == rage
          ? _value.rage
          : rage // ignore: cast_nullable_to_non_nullable
              as int?,
      fear: freezed == fear
          ? _value.fear
          : fear // ignore: cast_nullable_to_non_nullable
              as int?,
      regret: freezed == regret
          ? _value.regret
          : regret // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserMonthlyEmotionModelImpl implements _UserMonthlyEmotionModel {
  _$UserMonthlyEmotionModelImpl(
      {this.happy,
      this.love,
      this.expect,
      this.thanks,
      this.sad,
      this.rage,
      this.fear,
      this.regret});

  factory _$UserMonthlyEmotionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserMonthlyEmotionModelImplFromJson(json);

  @override
  final int? happy;
  @override
  final int? love;
  @override
  final int? expect;
  @override
  final int? thanks;
  @override
  final int? sad;
  @override
  final int? rage;
  @override
  final int? fear;
  @override
  final int? regret;

  @override
  String toString() {
    return 'UserMonthlyEmotionModel(happy: $happy, love: $love, expect: $expect, thanks: $thanks, sad: $sad, rage: $rage, fear: $fear, regret: $regret)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserMonthlyEmotionModelImpl &&
            (identical(other.happy, happy) || other.happy == happy) &&
            (identical(other.love, love) || other.love == love) &&
            (identical(other.expect, expect) || other.expect == expect) &&
            (identical(other.thanks, thanks) || other.thanks == thanks) &&
            (identical(other.sad, sad) || other.sad == sad) &&
            (identical(other.rage, rage) || other.rage == rage) &&
            (identical(other.fear, fear) || other.fear == fear) &&
            (identical(other.regret, regret) || other.regret == regret));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, happy, love, expect, thanks, sad, rage, fear, regret);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserMonthlyEmotionModelImplCopyWith<_$UserMonthlyEmotionModelImpl>
      get copyWith => __$$UserMonthlyEmotionModelImplCopyWithImpl<
          _$UserMonthlyEmotionModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserMonthlyEmotionModelImplToJson(
      this,
    );
  }
}

abstract class _UserMonthlyEmotionModel implements UserMonthlyEmotionModel {
  factory _UserMonthlyEmotionModel(
      {final int? happy,
      final int? love,
      final int? expect,
      final int? thanks,
      final int? sad,
      final int? rage,
      final int? fear,
      final int? regret}) = _$UserMonthlyEmotionModelImpl;

  factory _UserMonthlyEmotionModel.fromJson(Map<String, dynamic> json) =
      _$UserMonthlyEmotionModelImpl.fromJson;

  @override
  int? get happy;
  @override
  int? get love;
  @override
  int? get expect;
  @override
  int? get thanks;
  @override
  int? get sad;
  @override
  int? get rage;
  @override
  int? get fear;
  @override
  int? get regret;
  @override
  @JsonKey(ignore: true)
  _$$UserMonthlyEmotionModelImplCopyWith<_$UserMonthlyEmotionModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
