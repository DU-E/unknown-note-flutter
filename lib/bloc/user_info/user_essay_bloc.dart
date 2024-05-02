import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unknown_note_flutter/bloc/user_info/user_essay_event.dart';
import 'package:unknown_note_flutter/bloc/user_info/user_essay_state.dart';
import 'package:unknown_note_flutter/enums/enum_loading_status.dart';
import 'package:unknown_note_flutter/mixins/dio_exception_handler_mixin.dart';
import 'package:unknown_note_flutter/models/essay/essay_model.dart';
import 'package:unknown_note_flutter/repository/interface/interface_dude_essay_repository.dart';

class UserEssayBloc extends Bloc<UserEssayEvent, UserEssayState>
    with DioExceptionHandlerMixin {
  final IDudeEssayRepository dudeEssayRepository;
  final int userId;

  UserEssayBloc({
    required this.dudeEssayRepository,
    required this.userId,
  }) : super(const UserEssayState.init()) {
    on<UserEssayLoadMore>(_userEssayLoadMoreHandler);
    on<UserEssayRetry>(_userEssayRetryHandler);
  }

  Future<void> _userEssayLoadMoreHandler(
    UserEssayLoadMore event,
    Emitter<UserEssayState> emit,
  ) async {
    emit(state.copyWith(status: ELoadingStatus.loading));
    await handleApiRequest(
      () async {
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
      },
      state: state,
      emit: emit,
      initAfterError: false,
    );
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
