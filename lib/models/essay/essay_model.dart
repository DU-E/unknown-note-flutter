import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'essay_model.g.dart';

@JsonSerializable()
class EssayModel extends Equatable {
  final int? id;
  final String? author;
  final String? body;
  final List<String>? tags;

  const EssayModel({
    this.id,
    this.author,
    this.body,
    this.tags,
  });

  EssayModel copyWith({
    int? id,
    String? author,
    String? body,
    List<String>? tags,
  }) =>
      EssayModel(
        id: id ?? this.id,
        author: author ?? this.author,
        body: body ?? this.body,
        tags: tags ?? this.tags,
      );

  factory EssayModel.fromJson(Map<String, dynamic> json) =>
      _$EssayModelFromJson(json);

  Map<String, dynamic> toJson() => _$EssayModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        author,
        body,
        tags,
      ];
}
