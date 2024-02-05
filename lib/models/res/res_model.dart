import 'package:freezed_annotation/freezed_annotation.dart';

part 'res_model.freezed.dart';
part 'res_model.g.dart';

@Freezed(genericArgumentFactories: true)
class ResModel<T> with _$ResModel<T> {
  factory ResModel({
    required int code,
    String? message,
    T? data,
  }) = _ResModel;

  factory ResModel.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic json) fromJsonT,
  ) =>
      _$ResModelFromJson<T>(json, fromJsonT);
}
