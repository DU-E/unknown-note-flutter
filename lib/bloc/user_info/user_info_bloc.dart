import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unknown_note_flutter/bloc/authentication/auth_bloc_singleton.dart';
import 'package:unknown_note_flutter/bloc/authentication/auth_state.dart';
import 'package:unknown_note_flutter/bloc/user_info/user_info_event.dart';
import 'package:unknown_note_flutter/bloc/user_info/user_info_state.dart';
import 'package:unknown_note_flutter/enums/enum_loading_status.dart';
import 'package:unknown_note_flutter/models/res/res_model.dart';
import 'package:unknown_note_flutter/models/user/user_profile_model.dart';
import 'package:unknown_note_flutter/repository/dude_user_repository.dart';

class UserInfoBloc extends Bloc<UserInfoEvent, UserInfoState> {
  final DudeUserRepository userRepository;

  UserInfoBloc({
    required this.userRepository,
    int? userId,
  }) : super(const UserInfoState.init()) {
    on<UserInfoUpdateUser>(_userInfoUpdateUserHandler);
    on<UserInfoGet>(_userInfoGetHandler);

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
        message: '해당 유저를 찾을 수 없습니다.',
      ));
      return;
    }

    emit(state.copyWith(status: ELoadingStatus.loading));
    try {
      var res = await userRepository.getUserProfile(
        userId: event.userId,
      );

      emit(state.copyWith(
        status: ELoadingStatus.loaded,
        userId: event.userId,
        userProfile: res.data,
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
}
