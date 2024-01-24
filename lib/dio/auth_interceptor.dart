import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:unknown_note_flutter/bloc/authentication/auth_bloc_singleton.dart';
import 'package:unknown_note_flutter/bloc/authentication/auth_event.dart';
import 'package:unknown_note_flutter/constants/strings.dart';
import 'package:unknown_note_flutter/models/res/res_model.dart';

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

    // Error handling
    var res = ResModel.fromJson(response.data, (json) => null);
    if (res.code != 1000) {
      if (res.code == 2000) {
        AuthBlocSingleton.bloc.add(AuthSignoutEvent());
      }
      handler.reject(
        DioException.connectionError(
          requestOptions: response.requestOptions,
          reason: res.message ?? Strings.unknownFail,
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
        reason: err.message ?? Strings.unknownFail,
        error: ResModel(
          code: 5000,
          message: '통신에 실패했습니다.',
        ),
      ),
    );
  }
}
