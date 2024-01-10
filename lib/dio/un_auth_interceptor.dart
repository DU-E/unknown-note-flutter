import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class UnAuthInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // 기타 헤더 작성
    options.headers['Content-Type'] = 'application/json';

    // time-out 설정
    options.receiveTimeout = const Duration(seconds: 5);

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

    // Pro tip
    // refresh token이 제공되는 경우 여기서 토큰 재발급을 할 수 있음.
    // https://blog.yjyoon.dev/flutter/2021/11/28/flutter-06/
    handler.reject(err);
  }
}
