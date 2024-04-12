import 'package:draggable_menu/draggable_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:unknown_note_flutter/bloc/diary/diary_bloc.dart';
import 'package:unknown_note_flutter/bloc/diary/diary_event.dart';
import 'package:unknown_note_flutter/bloc/diary/diary_state.dart';
import 'package:unknown_note_flutter/constants/strings.dart';
import 'package:unknown_note_flutter/widgets/app_font.dart';
import 'package:unknown_note_flutter/widgets/common_draggable.dart';
import 'package:unknown_note_flutter/widgets/common_icon_button.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';
import 'package:unknown_note_flutter/enums/enum_loading_status.dart';
import 'package:unknown_note_flutter/package/flutter_card_swiper/card_swiper.dart';
import 'package:unknown_note_flutter/pages/diary/widgets/diary_card.dart';
import 'package:unknown_note_flutter/pages/diary/widgets/diary_skeleton.dart';
import 'package:unknown_note_flutter/pages/diary/widgets/diary_slide_widget.dart';
import 'package:unknown_note_flutter/widgets/common_shadow_container.dart';

class DiaryPage extends StatefulWidget {
  const DiaryPage({super.key});

  @override
  State<DiaryPage> createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  late final CardSwiperController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CardSwiperController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onAddTap() {
    context.push('/write/diary');
  }

  void _onSettingTap(BuildContext context) {
    DraggableMenu.open(
      context,
      CommonDraggable(
        child: DiarySlideWidget(
          diaryBloc: context.read<DiaryBloc>(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CardSwiper(
          cardsCount: 3,
          numberOfCardsDisplayed: 3,
          threshold: 150,
          backCardOffset: const Offset(0, 50),
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).padding.bottom + Sizes.size72,
            top: Sizes.size20,
            left: Sizes.size20,
            right: Sizes.size20,
          ),
          cardBuilder: (context, index, _, __) =>
              BlocBuilder<DiaryBloc, DiaryState>(
            builder: (context, state) {
              if (state.status == ELoadingStatus.init) {
                context.read<DiaryBloc>().add(DiaryGet());
              }
              if (index != 0 ||
                  state.status == ELoadingStatus.init ||
                  state.status == ELoadingStatus.loading) {
                return DiarySkeleton(seed: state.page);
              }
              if (state.status == ELoadingStatus.error) {
                return CommonShadowContainer(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(Sizes.size20),
                      child: AppFont(state.message ?? Strings.unknownFail),
                    ),
                  ),
                );
              }
              return DiaryCard(diary: state.diary!);
            },
          ),
          onSwipe: (previousIndex, currentIndex, direction) {
            _controller.undo();
            context.read<DiaryBloc>().add(DiaryGet());
            return false;
          },
        ),
        SafeArea(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                left: Sizes.size28,
                right: Sizes.size28,
                bottom: Sizes.size80,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonIconButton(
                    icon: Icons.add_rounded,
                    onTap: _onAddTap,
                  ),
                  CommonIconButton(
                    icon: Icons.settings_rounded,
                    onTap: () => _onSettingTap(context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
