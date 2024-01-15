import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:unknown_note_flutter/enums/enum_emotion.dart';

part 'diary_model.g.dart';

@JsonSerializable(explicitToJson: true)
class DiaryModel extends Equatable {
  final int? id;
  final String? content;
  final EEmotion? emotion;
  final bool? isOpen;
  final List<String>? tags;
  final DateTime? date;

  const DiaryModel({
    this.id,
    this.content,
    this.emotion,
    this.isOpen,
    this.tags,
    this.date,
  });

  DiaryModel copyWith({
    int? id,
    String? content,
    EEmotion? emotion,
    bool? isOpen,
    List<String>? tags,
    DateTime? date,
  }) =>
      DiaryModel(
        id: id ?? this.id,
        content: content ?? this.content,
        emotion: emotion ?? this.emotion,
        isOpen: isOpen ?? this.isOpen,
        tags: tags ?? this.tags,
        date: date ?? this.date,
      );

  factory DiaryModel.fromJson(Map<String, dynamic> json) =>
      _$DiaryModelFromJson(json);

  Map<String, dynamic> toJson() => _$DiaryModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        content,
        emotion,
        isOpen,
        tags,
        date,
      ];
}
