import 'package:dio/dio.dart';
import 'package:unknown_note_flutter/constants/strings.dart';
import 'package:unknown_note_flutter/models/res/res_model.dart';

void mockThrowDioError({
  required ResModel<void> errorModel,
}) {
  throw DioException.connectionError(
    requestOptions: RequestOptions(),
    reason: errorModel.message ?? Strings.unknownFail,
    error: ResModel(
      code: errorModel.code,
      message: errorModel.message,
    ),
  );
}
