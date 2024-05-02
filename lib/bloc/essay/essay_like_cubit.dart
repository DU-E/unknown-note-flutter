import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unknown_note_flutter/bloc/abs_bloc_state.dart';
import 'package:unknown_note_flutter/constants/strings.dart';
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
        message: '[${error.code}] ${error.message ?? Strings.unknownFail}',
        isLike: preSubState,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ELoadingStatus.error,
        message: '[5001] ${e.toString().replaceAll('Exception: ', '')}',
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

class EssayLikeState extends BlocState {
  final bool isLike;

  const EssayLikeState({
    required this.isLike,
    required super.status,
    super.message,
  });

  const EssayLikeState.init()
      : isLike = false,
        super(
          status: ELoadingStatus.init,
        );

  @override
  EssayLikeState copyWith({
    bool? isLike,
    ELoadingStatus? status,
    String? message,
  }) =>
      EssayLikeState(
        isLike: isLike ?? this.isLike,
        status: status ?? status ?? this.status,
        message: message ?? this.message,
      );

  @override
  List<Object?> get props => [
        isLike,
        status,
        message,
      ];
}
