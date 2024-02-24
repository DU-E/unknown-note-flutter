import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unknown_note_flutter/enums/enum_essay_category.dart';
import 'package:unknown_note_flutter/models/user/user_model.dart';

part 'essay_model.freezed.dart';
part 'essay_model.g.dart';

@freezed
class EssayModel with _$EssayModel {
  factory EssayModel({
    @JsonKey(name: 'essayid') int? id,
    @JsonKey(name: 'etitle') String? title,
    @JsonKey(name: 'econtent') String? content,
    @JsonKey(name: 'etime') DateTime? time,
    @JsonKey(name: 'elikes') int? likes,
    @JsonKey(name: 'ecategory') EEssayCategory? category,
    UserModel? user,
  }) = _EssayModel;

  factory EssayModel.fromJson(Map<String, dynamic> json) =>
      _$EssayModelFromJson(json);
}
