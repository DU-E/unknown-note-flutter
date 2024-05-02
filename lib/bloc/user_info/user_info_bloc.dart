import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unknown_note_flutter/bloc/authentication/auth_bloc_singleton.dart';
import 'package:unknown_note_flutter/bloc/authentication/auth_state.dart';
import 'package:unknown_note_flutter/bloc/user_info/user_info_event.dart';
import 'package:unknown_note_flutter/bloc/user_info/user_info_state.dart';
import 'package:unknown_note_flutter/enums/enum_loading_status.dart';
import 'package:unknown_note_flutter/mixins/dio_exception_handler_mixin.dart';
import 'package:unknown_note_flutter/models/user/user_profile_model.dart';
import 'package:unknown_note_flutter/repository/interface/interfece_dude_user_repository.dart';

class UserInfoBloc extends Bloc<UserInfoEvent, UserInfoState>
    with DioExceptionHandlerMixin {
  final IDudeUserRepository userRepository;

  UserInfoBloc({
    required this.userRepository,
    int? userId,
  }) : super(const UserInfoState.init()) {
    on<UserInfoUpdateUser>(_userInfoUpdateUserHandler);
    on<UserInfoGet>(_userInfoGetHandler);
    on<UserInfoTapSubs>(_userInfoTapSubsHandler);

    // userId != null -> 다른 사람의 프로필을 보는 경우
    if (userId != null) {
      add(UserInfoGet(userId));
    }
    // userId == null -> bottomNav에서 내 정보를 보는 경우
    else {
      var myState = AuthBlocSingleton.bloc.state;
      if (myState is AuthAuthState) {
        add(UserInfoUpdateUser(myState.user));
      }
    }
  }

  Future<void> _userInfoUpdateUserHandler(
    UserInfoUpdateUser event,
    Emitter<UserInfoState> emit,
  ) async {
    emit(
      state.copyWith(
        userProfile: UserProfileModel(user: event.user),
      ),
    );

    await _userInfoGetHandler(UserInfoGet(event.user.userId!), emit);
  }

  Future<void> _userInfoGetHandler(
    UserInfoGet event,
    Emitter<UserInfoState> emit,
  ) async {
    // Validation
    if (event.userId == -1) {
      emit(state.copyWith(
        status: ELoadingStatus.error,
        infoStatus: ELoadingStatus.error,
        message: '해당 유저를 찾을 수 없습니다.',
      ));
      return;
    }

    emit(state.copyWith(
      status: ELoadingStatus.loading,
      infoStatus: ELoadingStatus.loading,
    ));
    await handleApiRequest(
      () async {
        var res = await userRepository.getUserProfile(
          userId: event.userId,
        );

        emit(state.copyWith(
          status: ELoadingStatus.loaded,
          infoStatus: ELoadingStatus.loaded,
          userId: event.userId,
          userProfile: res.data,
        ));
      },
      state: state,
      emit: emit,
      initAfterError: false,
      finallyCall: () async {
        if (state.status == ELoadingStatus.error) {
          emit(state.copyWith(
            infoStatus: ELoadingStatus.error,
          ));
        }
      },
    );
  }

  Future<void> _userInfoTapSubsHandler(
    UserInfoTapSubs event,
    Emitter<UserInfoState> emit,
  ) async {
    if (state.infoStatus != ELoadingStatus.loaded) return;
    if (state.subStatus == ELoadingStatus.loading) return;

    bool preSubState = state.userProfile?.isSubscribed ?? false;
    // 우선 바로 구독상태 변경
    emit(state.copyWith(
      status: ELoadingStatus.loading,
      subStatus: ELoadingStatus.loading,
      userProfile: state.userProfile?.copyWith(
        isSubscribed: !preSubState,
      ),
    ));

    await handleApiRequest(
      () async {
        // 구독상태면 구독 해제 / 반대의 경우 구독
        if (preSubState) {
          await userRepository.deleteSubscribe(userId: event.userId);
        } else {
          await userRepository.postSubscribe(userId: event.userId);
        }
        // 성공시 추가 변경 없음
      },
      state: state,
      emit: emit,
      initAfterError: false,
      finallyCall: () async {
        if (state.status == ELoadingStatus.error) {
          // 실패시 원상 복구
          emit(state.copyWith(
            status: ELoadingStatus.error,
            subStatus: ELoadingStatus.error,
            userProfile: state.userProfile?.copyWith(
              isSubscribed: preSubState,
            ),
          ));
        }
        emit(state.copyWith(
          status: ELoadingStatus.init,
          subStatus: ELoadingStatus.init,
        ));
      },
    );
  }
}
