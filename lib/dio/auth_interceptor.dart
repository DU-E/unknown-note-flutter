import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:unknown_note_flutter/bloc/authentication/auth_bloc_singleton.dart';
import 'package:unknown_note_flutter/bloc/authentication/auth_event.dart';
import 'package:unknown_note_flutter/constants/strings.dart';

class AuthInterceptor extends Interceptor {
  late final FlutterSecureStorage _storage;

  AuthInterceptor() {
    _storage = const FlutterSecureStorage();
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // jwt token 불러오기
    final jwt = await _storage.read(key: Strings.jwtToken);

    // 기타 헤더 작성
    options.headers['Content-Type'] = 'application/json';

    // time-out 설정
    options.receiveTimeout = const Duration(seconds: 5);

    // 매 요청마다 헤더에 token 포함
    options.headers['x-access-token'] = jwt;

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

    // Logout
    // TODO: change condition: jwt auth error
    if (true) {
      AuthBlocSingleton.bloc.add(AuthSignoutEvent());
    }

    // Pro tip
    // refresh token이 제공되는 경우 여기서 토큰 재발급을 할 수 있음.
    // https://blog.yjyoon.dev/flutter/2021/11/28/flutter-06/
    handler.reject(err);
  }
}
