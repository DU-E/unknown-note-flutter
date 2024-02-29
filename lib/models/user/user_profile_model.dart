import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unknown_note_flutter/enums/enum_emotion.dart';
import 'package:unknown_note_flutter/models/user/user_model.dart';

part 'user_profile_model.freezed.dart';
part 'user_profile_model.g.dart';

@freezed
class UserProfileModel with _$UserProfileModel {
  factory UserProfileModel({
    UserModel? user,
    @JsonKey(name: 'essay_cnt') int? essayCount,
    @JsonKey(name: 'journal_cnt') int? diaryCount,
    @JsonKey(name: 'recent_graph') List<UserStatsDataModel>? recentGraph,
    @JsonKey(name: 'monthly_act') List<UserStatsDataModel>? monthlyAct,
    @JsonKey(name: 'monthly_emo') UserMonthlyEmotionModel? monthlyEmotions,
    EEmotion? flower,
  }) = _UserProfileModel;

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileModelFromJson(json);
}

@freezed
class UserStatsDataModel with _$UserStatsDataModel {
  factory UserStatsDataModel({
    DateTime? date,
    num? value,
  }) = _UserStatsDataModel;

  factory UserStatsDataModel.fromJson(Map<String, dynamic> json) =>
      _$UserStatsDataModelFromJson(json);
}

@freezed
class UserMonthlyEmotionModel with _$UserMonthlyEmotionModel {
  factory UserMonthlyEmotionModel({
    int? happy,
    int? love,
    int? expect,
    int? thanks,
    int? sad,
    int? anger,
    int? fear,
    int? regret,
  }) = _UserMonthlyEmotionModel;

  factory UserMonthlyEmotionModel.fromJson(Map<String, dynamic> json) =>
      _$UserMonthlyEmotionModelFromJson(json);
}
