import 'package:draggable_menu/draggable_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:unknown_note_flutter/bloc/setting/setting_bloc.dart';
import 'package:unknown_note_flutter/bloc/setting/setting_state.dart';
import 'package:unknown_note_flutter/enums/enum_font.dart';
import 'package:unknown_note_flutter/pages/read_diary/widgets/read_diary_slide_widget.dart';
import 'package:unknown_note_flutter/utils/date_formatter.dart';
import 'package:unknown_note_flutter/widgets/app_font.dart';
import 'package:unknown_note_flutter/widgets/common_draggable.dart';
import 'package:unknown_note_flutter/widgets/common_icon_button.dart';
import 'package:unknown_note_flutter/constants/gaps.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';
import 'package:unknown_note_flutter/constants/strings.dart';
import 'package:unknown_note_flutter/models/diary/diary_model.dart';

class ReadDiaryPage extends StatelessWidget {
  final DiaryModel diary;

  const ReadDiaryPage({
    super.key,
    required this.diary,
  });

  void _onSettingTap(BuildContext context) async {
    var res = await DraggableMenu.open(
      context,
      const CommonDraggable(
        child: ReadDiarySlideWidget(),
      ),
    );
    if (res == true) {
      context.replace(
        '/write/diary',
        extra: diary,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppFont(
          '내 일기',
          size: Sizes.size16,
        ),
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.6),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        Gaps.v10,
                        Image.asset(
                          'assets/images/emotions/${diary.emotion?.key ?? 'happy'}_img.png',
                          width: Sizes.size72,
                          height: Sizes.size72,
                        ),
                        Gaps.v4,
                        AppFont(
                          dateToYMD(diary.time),
                          weight: FontWeight.w700,
                        ),
                        AppFont(dateToE(diary.time)),
                        Gaps.v20,
                      ],
                    ),
                  ),
                  BlocBuilder<SettingBloc, SettingState>(
                    builder: (context, state) => AppFont(
                      diary.content ?? Strings.nullStr,
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
    );
  }
}
