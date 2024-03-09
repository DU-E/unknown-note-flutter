import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unknown_note_flutter/bloc/user_edit/user_edit_bloc.dart';
import 'package:unknown_note_flutter/bloc/user_edit/user_edit_event.dart';
import 'package:unknown_note_flutter/bloc/user_edit/user_edit_state.dart';
import 'package:unknown_note_flutter/constants/gaps.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';
import 'package:unknown_note_flutter/constants/strings.dart';
import 'package:unknown_note_flutter/enums/enum_loading_status.dart';
import 'package:unknown_note_flutter/widgets/app_font.dart';
import 'package:unknown_note_flutter/widgets/common_button.dart';
import 'package:unknown_note_flutter/widgets/common_snackbar.dart';
import 'package:unknown_note_flutter/widgets/common_text_form.dart';

class UserEditPage extends StatefulWidget {
  final bool popAble;

  const UserEditPage({
    super.key,
    this.popAble = false,
  });

  @override
  State<UserEditPage> createState() => _UserEditPageState();
}

class _UserEditPageState extends State<UserEditPage> {
  void _onTapSelectImage() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null && mounted) {
      context.read<UserEditBloc>().add(UserEditChangeImage(image));
    }
  }

  void _onTapRemoveImage() {
    context.read<UserEditBloc>().add(UserEditChangeImage(null));
  }

  void _onNickNameChange(String nickName) {
    context.read<UserEditBloc>().add(UserEditChangeNickName(nickName));
  }

  void _onIntroduceChange(String introduce) {
    context.read<UserEditBloc>().add(UserEditChangeIntroduce(introduce));
  }

  void _onTapComplete() {
    context.read<UserEditBloc>().add(UserEditSubmit());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserEditBloc, UserEditState>(
      listener: (context, state) {
        if (state.status == ELoadingStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            CommonSnackbar(
              context,
              content: AppFont(state.message ?? Strings.unknownFail),
            ),
          );
        }
        if (state.status == ELoadingStatus.loaded) {
          if (widget.popAble) {
            context.pop(true);
          } else {
            context.replace('/home');
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor.withOpacity(0.6),
          surfaceTintColor: Colors.transparent,
          foregroundColor: Colors.white,
          centerTitle: true,
          title: const AppFont(
            '프로필 설정',
            size: Sizes.size16,
            weight: FontWeight.w700,
          ),
          leading: widget.popAble ? null : const SizedBox(),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Sizes.size20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        BlocBuilder<UserEditBloc, UserEditState>(
                          builder: (context, state) => GestureDetector(
                            onTap: _onTapSelectImage,
                            child: Container(
                              width: Sizes.size80,
                              height: Sizes.size80,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Theme.of(context).primaryColor,
                              ),
                              clipBehavior: Clip.hardEdge,
                              child: _profileImageSelector(state),
                            ),
                          ),
                        ),
                        IgnorePointer(
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: Sizes.size32,
                            shadows: [
                              Shadow(
                                color: Theme.of(context).shadowColor,
                                blurRadius: Sizes.size5,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Gaps.h20,
                    CommonButton(
                      color: Theme.of(context).primaryColor.withOpacity(0.6),
                      shadowColor: Colors.transparent,
                      onTap: _onTapRemoveImage,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: Sizes.size10),
                        child: AppFont(
                          '사진 지우기',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                Gaps.v20,
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: Sizes.size10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).primaryColor.withOpacity(0.6),
                    ),
                    borderRadius: BorderRadius.circular(Sizes.size10),
                  ),
                  child: CommonTextForm(
                    hintText: '닉네임',
                    initText: context.read<UserEditBloc>().state.user.nickName,
                    getValue: _onNickNameChange,
                  ),
                ),
                Gaps.v10,
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: Sizes.size10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).primaryColor.withOpacity(0.6),
                    ),
                    borderRadius: BorderRadius.circular(Sizes.size10),
                  ),
                  child: CommonTextForm(
                    hintText: '한 줄 소개',
                    initText: context.read<UserEditBloc>().state.user.introduce,
                    getValue: _onIntroduceChange,
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BlocBuilder<UserEditBloc, UserEditState>(
          builder: (context, state) {
            return CommonButton(
              color: Theme.of(context).primaryColor.withOpacity(0.6),
              shadowColor: Colors.transparent,
              borderRadius: 0,
              onTap: state.status == ELoadingStatus.loading
                  ? null
                  : _onTapComplete,
              child: Container(
                width: double.infinity,
                height: Sizes.size52,
                margin: EdgeInsets.only(
                  bottom: MediaQuery.paddingOf(context).bottom,
                ),
                child: Center(
                  child: state.status == ELoadingStatus.loading
                      ? const SizedBox(
                          width: Sizes.size28,
                          height: Sizes.size28,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : const AppFont(
                          '저장',
                          color: Colors.white,
                          weight: FontWeight.w700,
                        ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _profileImageSelector(UserEditState state) {
    if (state.removeImage) {
      return const Icon(
        Icons.person,
        size: Sizes.size60,
        color: Colors.white,
      );
    }
    if (state.image != null) {
      return Image.file(
        File(state.image!.path),
        fit: BoxFit.cover,
      );
    }
    if (state.user.profileImg?.isNotEmpty == true) {
      return Image.network(
        state.user.profileImg!,
        fit: BoxFit.cover,
      );
    }
    return const Icon(
      Icons.person,
      size: Sizes.size60,
      color: Colors.white,
    );
  }
}
