import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unknown_note_flutter/bloc/authentication/auth_bloc_singleton.dart';
import 'package:unknown_note_flutter/bloc/authentication/auth_event.dart';
import 'package:unknown_note_flutter/bloc/user_edit/user_edit_event.dart';
import 'package:unknown_note_flutter/bloc/user_edit/user_edit_state.dart';
import 'package:unknown_note_flutter/constants/strings.dart';
import 'package:unknown_note_flutter/enums/enum_loading_status.dart';
import 'package:unknown_note_flutter/models/res/res_model.dart';
import 'package:unknown_note_flutter/models/user/user_model.dart';
import 'package:unknown_note_flutter/repository/dude_image_repository.dart';
import 'package:unknown_note_flutter/repository/dude_user_repository.dart';

class UserEditBloc extends Bloc<UserEditEvent, UserEditState> {
  final DudeUserRepository dudeUserRepository;
  final DudeImageRepository dudeImageRepository;

  UserEditBloc({
    required this.dudeUserRepository,
    required this.dudeImageRepository,
    UserModel? user,
  }) : super(UserEditState.init(user: user)) {
    on<UserEditChangeImage>(_userEditChangeImageHandler);
    on<UserEditChangeNickName>(_userEditChangeNickNameHandler);
    on<UserEditChangeIntroduce>(_userEditChangeIntroduceHandler);
    on<UserEditSubmit>(_userEditSubmitHandler);
  }

  Future<void> _userEditChangeImageHandler(
    UserEditChangeImage event,
    Emitter<UserEditState> emit,
  ) async {
    if (event.image != null) {
      emit(state.copyWith(
        image: event.image,
        removeImage: false,
      ));
    } else {
      emit(state.copyWith(removeImage: true));
    }
  }

  Future<void> _userEditChangeNickNameHandler(
    UserEditChangeNickName event,
    Emitter<UserEditState> emit,
  ) async {
    emit(state.copyWith(
      user: state.user.copyWith(
        nickName: event.nickName,
      ),
    ));
  }

  Future<void> _userEditChangeIntroduceHandler(
    UserEditChangeIntroduce event,
    Emitter<UserEditState> emit,
  ) async {
    emit(state.copyWith(
      user: state.user.copyWith(
        introduce: event.introduce,
      ),
    ));
  }

  Future<void> _userEditSubmitHandler(
    UserEditSubmit event,
    Emitter<UserEditState> emit,
  ) async {
    if (state.status == ELoadingStatus.loading) return;

    // Validate
    if (state.user.nickName == null || state.user.nickName == Strings.nullStr) {
      emit(state.copyWith(
        status: ELoadingStatus.error,
        message: '닉네임을 입력해주세요.',
      ));
      emit(state.copyWith(status: ELoadingStatus.init));
      return;
    }

    try {
      emit(state.copyWith(status: ELoadingStatus.loading));

      if (!state.removeImage && state.image != null) {
        var res = await dudeImageRepository.postImage(image: state.image!);
        emit(state.copyWith(
          user: state.user.copyWith(
            profileImg: res.data,
          ),
        ));
      }
      if (state.removeImage) {
        emit(state.copyWith(
          user: state.user.copyWith(
            profileImg: Strings.nullStr,
          ),
        ));
      }

      await dudeUserRepository.patchUser(
        user: state.user,
      );

      AuthBlocSingleton.bloc.add(AuthSetUserEvnet(state.user));

      emit(state.copyWith(status: ELoadingStatus.loaded));
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
