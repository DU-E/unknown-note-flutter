import 'package:draggable_menu/draggable_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:unknown_note_flutter/bloc/essay/essay_like_cubit.dart';
import 'package:unknown_note_flutter/bloc/setting/setting_bloc.dart';
import 'package:unknown_note_flutter/bloc/setting/setting_state.dart';
import 'package:unknown_note_flutter/constants/strings.dart';
import 'package:unknown_note_flutter/enums/enum_font.dart';
import 'package:unknown_note_flutter/enums/enum_loading_status.dart';
import 'package:unknown_note_flutter/pages/read_essay/widgets/read_essay_like_button.dart';
import 'package:unknown_note_flutter/pages/read_essay/widgets/read_essay_slide_widget.dart';
import 'package:unknown_note_flutter/utils/date_formatter.dart';
import 'package:unknown_note_flutter/widgets/app_font.dart';
import 'package:unknown_note_flutter/widgets/common_draggable.dart';
import 'package:unknown_note_flutter/widgets/common_horizontal_spliter.dart';
import 'package:unknown_note_flutter/widgets/common_icon_button.dart';
import 'package:unknown_note_flutter/widgets/common_snackbar.dart';
import 'package:unknown_note_flutter/widgets/common_tagitem_widget.dart';
import 'package:unknown_note_flutter/constants/gaps.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';
import 'package:unknown_note_flutter/models/essay/essay_model.dart';

class ReadEssayPage extends StatelessWidget {
  final EssayModel essay;

  const ReadEssayPage({
    super.key,
    required this.essay,
  });

  void _onSettingTap(BuildContext context) async {
    var res = await DraggableMenu.open(
      context,
      const CommonDraggable(
        child: ReadEssaySlideWidget(
          // TODO: check essay author id == user id
          isWriter: true,
        ),
      ),
    );
    if (res == true) {
      // ignore: use_build_context_synchronously
      context.replace(
        '/write/essay',
        extra: essay,
      );
    }
  }

  void _onNickNameTap(BuildContext context) {
    context.push(
      '/profile/${essay.user?.userId ?? -1}',
      extra: essay.user?.nickName,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<EssayLikeCubit, EssayLikeState>(
      listener: (context, state) {
        if (state.status == ELoadingStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            CommonSnackbar(
              context,
              content: AppFont(state.message ?? Strings.unknownFail),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: AppFont(
            essay.title ?? '',
            size: Sizes.size20,
          ),
          backgroundColor: Theme.of(context).primaryColor.withOpacity(0.6),
          foregroundColor: Colors.white,
          centerTitle: false,
          actions: const [
            ReadEssayLikeButton(),
          ],
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(Sizes.size20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const AppFont('글쓴이'),
                        Gaps.h5,
                        InkWell(
                          onTap: () => _onNickNameTap(context),
                          child: CommonTagItemWidget(
                            tag: essay.user?.nickName ?? "Anonymous",
                          ),
                        ),
                      ],
                    ),
                    Gaps.v3,
                    Row(
                      children: [
                        const AppFont('작성일'),
                        Gaps.h5,
                        CommonTagItemWidget(
                          tag: dateToYMD(essay.time),
                        ),
                        Gaps.h3,
                        CommonTagItemWidget(
                          tag: dateToE(essay.time),
                        ),
                      ],
                    ),
                    Gaps.v20,
                    const CommonHorizontalSpliter(),
                    Gaps.v20,
                    BlocBuilder<SettingBloc, SettingState>(
                      builder: (context, state) => AppFont(
                        essay.content ?? '',
                        font: state.font ?? EFont.pretendard,
                        size: state.getZoom(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.only(
                  right: Sizes.size20,
                  bottom: MediaQuery.of(context).padding.bottom + Sizes.size20,
                ),
                child: CommonIconButton(
                  icon: Icons.settings_rounded,
                  onTap: () => _onSettingTap(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
