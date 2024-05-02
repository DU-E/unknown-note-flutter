import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unknown_note_flutter/bloc/abs_bloc_state.dart';
import 'package:unknown_note_flutter/constants/strings.dart';
import 'package:unknown_note_flutter/enums/enum_loading_status.dart';
import 'package:unknown_note_flutter/models/res/res_model.dart';

mixin DioExceptionHandlerMixin {
  /// ### **NOTICE**
  ///
  /// [state] \
  /// 인자로 받는 state는 [handleApiRequest]가 호출될 당시의 state를 가짐에 주의합시다.
  ///
  /// [initAfterError] \
  /// `status == ELoadingStatus.error` 상태를 유지해야 하는 경우에 `false`로 사용합니다.
  ///
  /// **Example**
  /// - 데이터를 post, patch 하는 화면이 아닌, get 하는 화면에서 에러시 에러 메세지를 화면에 직접 뿌려줘야 할 때
  /// - 무한 스크롤로 페이징 기능 수행할 때
  Future<void> handleApiRequest(
    Future<void> Function() apiCall, {
    Future<void> Function()? finallyCall,
    required BlocState state,
    required Emitter<BlocState> emit,
    bool initAfterError = true,
  }) async {
    try {
      await apiCall();
    } on DioException catch (e) {
      var error = e.error as ResModel<void>;
      emit(state.copyWith(
        status: ELoadingStatus.error,
        message: '[${error.code}] ${error.message ?? Strings.unknownFail}',
      ));
      debugPrint('[DioExceptionHandlerMixin/DioException] ${error.message}');
      if (initAfterError) {
        emit(state.copyWith(status: ELoadingStatus.init));
      }
    } catch (e, s) {
      emit(state.copyWith(
        status: ELoadingStatus.error,
        message: '[5001] ${e.toString().replaceAll('Exception: ', '')}',
      ));
      debugPrint('[DioExceptionHandlerMixin/Exception] ${e.toString()}');
      debugPrintStack(stackTrace: s);
      if (initAfterError) {
        emit(state.copyWith(status: ELoadingStatus.init));
      }
    } finally {
      await finallyCall?.call();
    }
  }
}
