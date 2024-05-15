import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:unknown_note_flutter/constants/strings.dart';
import 'package:unknown_note_flutter/models/res/res_model.dart';

class UnAuthInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // 기타 헤더 작성
    options.headers[HttpHeaders.contentTypeHeader] = 'application/json';

    // time-out 설정
    options.receiveTimeout = const Duration(seconds: 5);

    // base url 설정
    options.baseUrl = Strings.baseUrl;

    return handler.next(options);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    // Logging
    debugPrint(
      '[RES] [${response.requestOptions.method}] ${response.requestOptions.uri}',
    );

    print(response.data);

    // Error handling
    var res = ResModel.fromJson(response.data, (json) => null);
    if (res.code != 1000) {
      handler.reject(
        DioException.connectionError(
          requestOptions: response.requestOptions,
          reason: res.message ?? 'UNCAUGHT ERROR',
          error: res,
        ),
      );
      return;
    }

    handler.next(response);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    // Logging
    debugPrint(
      '[ERR] [${err.requestOptions.method}] ${err.requestOptions.uri}',
    );
    debugPrint(
      '[ERR] code: ${err.response?.statusCode}',
    );

    handler.reject(
      DioException.connectionError(
        requestOptions: err.requestOptions,
        reason: err.message ?? 'UNCAUGHT ERROR',
        error: ResModel(
          code: 5000,
          message: '통신에 실패했습니다.',
        ),
      ),
    );
  }
}
