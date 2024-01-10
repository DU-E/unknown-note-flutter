import 'package:dio/dio.dart';
import 'package:unknown_note_flutter/dio/auth_interceptor.dart';
import 'package:unknown_note_flutter/dio/un_auth_interceptor.dart';

class DioMiddleware {
  DioMiddleware._constructor();
  static final DioMiddleware _instance = DioMiddleware._constructor();
  static DioMiddleware get instance => _instance;

  final Dio _dio = Dio();

  Future<Response<T>> withAuth<T>(Future<Response<T>> httpMethod) async {
    _dio.interceptors.clear();
    _dio.interceptors.add(AuthInterceptor());
    return await httpMethod;
  }

  Future<Response<T>> withoutAuth<T>(Future<Response<T>> httpMethod) async {
    _dio.interceptors.clear();
    _dio.interceptors.add(UnAuthInterceptor());
    return await httpMethod;
  }
}
