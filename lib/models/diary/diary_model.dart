import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unknown_note_flutter/enums/enum_emotion.dart';
import 'package:unknown_note_flutter/utils/openable_converter.dart';

part 'diary_model.freezed.dart';
part 'diary_model.g.dart';

@freezed
class DiaryModel with _$DiaryModel {
  factory DiaryModel({
    @JsonKey(name: 'diaryid') int? id,
    @JsonKey(name: 'dcontent') String? content,
    @JsonKey(name: 'dtime') DateTime? time,
    @JsonKey(name: 'dtag') EEmotion? emotion,
    @JsonKey(name: 'userid') int? userId,
    @JsonKey(
      name: 'openable',
      fromJson: openableFromJson,
      toJson: openableToJson,
    )
    bool? isOpen,
  }) = _DiaryModel;

  factory DiaryModel.fromJson(Map<String, dynamic> json) =>
      _$DiaryModelFromJson(json);
}
