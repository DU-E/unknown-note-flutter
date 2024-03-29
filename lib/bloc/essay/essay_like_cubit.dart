import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unknown_note_flutter/enums/enum_loading_status.dart';
import 'package:unknown_note_flutter/models/res/res_model.dart';
import 'package:unknown_note_flutter/repository/dude_essay_repository.dart';

class EssayLikeCubit extends Cubit<EssayLikeState> {
  final DudeEssayRepository essayRepository;
  final int essayId;

  EssayLikeCubit({
    required this.essayRepository,
    required this.essayId,
  }) : super(const EssayLikeState.init());

  void tapLike() async {
    if (state.status == ELoadingStatus.loading) return;

    bool preSubState = state.isLike;

    try {
      // 우선 바로 구독상태 변경
      emit(state.copyWith(
        status: ELoadingStatus.loading,
        isLike: !preSubState,
      ));
      // 구독상태면 구독 해제 / 반대의 경우 구독
      if (preSubState) {
        await essayRepository.deleteLike(essayId: essayId);
      } else {
        await essayRepository.postLike(essayId: essayId);
      }
      // 성공시 추가 변경 없음
      emit(state.copyWith(status: ELoadingStatus.init));
    } on DioException catch (e) {
      var error = e.error as ResModel<void>;
      // 실패시 원상 복구
      emit(state.copyWith(
        status: ELoadingStatus.error,
        message: '[${error.code}] ${error.message as String}',
        isLike: preSubState,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ELoadingStatus.error,
        message: '[5001] ${e.toString()}',
        isLike: preSubState,
      ));
    } finally {
      if (state.status == ELoadingStatus.error) {
        emit(state.copyWith(
          status: ELoadingStatus.init,
        ));
      }
    }
  }
}

class EssayLikeState extends Equatable {
  final ELoadingStatus status;
  final bool isLike;
  final String? message;

  const EssayLikeState({
    required this.status,
    required this.isLike,
    this.message,
  });

  const EssayLikeState.init()
      : status = ELoadingStatus.init,
        isLike = false,
        message = null;

  EssayLikeState copyWith({
    ELoadingStatus? status,
    bool? isLike,
    String? message,
  }) =>
      EssayLikeState(
        status: status ?? status ?? this.status,
        isLike: isLike ?? this.isLike,
        message: message ?? this.message,
      );

  @override
  List<Object?> get props => [
        status,
        isLike,
        message,
      ];
}
