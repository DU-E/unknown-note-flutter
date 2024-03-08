import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unknown_note_flutter/bloc/user_info/user_essay_event.dart';
import 'package:unknown_note_flutter/bloc/user_info/user_essay_state.dart';
import 'package:unknown_note_flutter/enums/enum_loading_status.dart';
import 'package:unknown_note_flutter/models/essay/essay_model.dart';
import 'package:unknown_note_flutter/models/res/res_model.dart';
import 'package:unknown_note_flutter/repository/dude_essay_repository.dart';

class UserEssayBloc extends Bloc<UserEssayEvent, UserEssayState> {
  final DudeEssayRepository dudeEssayRepository;
  final int userId;

  UserEssayBloc({
    required this.dudeEssayRepository,
    required this.userId,
  }) : super(UserEssayState.init()) {
    on<UserEssayLoadMore>(_userEssayLoadMoreHandler);
    on<UserEssayRetry>(_userEssayRetryHandler);
  }

  Future<void> _userEssayLoadMoreHandler(
    UserEssayLoadMore event,
    Emitter<UserEssayState> emit,
  ) async {
    emit(state.copyWith(status: ELoadingStatus.loading));

    try {
      var res = await dudeEssayRepository.getUserEssayList(
        userId: userId,
        page: state.page + 1,
      );

      List<EssayModel> newList = [];
      newList
        ..addAll(state.list)
        ..addAll(res.data ?? []);

      emit(state.copyWith(
        status: ELoadingStatus.loaded,
        list: newList,
        page: state.page + 1,
      ));
    } on DioException catch (e) {
      var error = e.error as ResModel<void>;
      emit(state.copyWith(
        status: ELoadingStatus.error,
        message: '[${error.code}] ${error.message as String}',
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ELoadingStatus.error,
        message: '[5001] ${e.toString()}',
      ));
    }
  }

  Future<void> _userEssayRetryHandler(
    UserEssayRetry event,
    Emitter<UserEssayState> emit,
  ) async {
    emit(state.copyWith(
      status: ELoadingStatus.init,
    ));
  }
}
