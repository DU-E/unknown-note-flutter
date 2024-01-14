import 'package:draggable_menu/draggable_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:unknown_note_flutter/bloc/diary/diary_bloc.dart';
import 'package:unknown_note_flutter/bloc/diary/diary_event.dart';
import 'package:unknown_note_flutter/bloc/diary/diary_state.dart';
import 'package:unknown_note_flutter/common/widgets/common_draggable.dart';
import 'package:unknown_note_flutter/common/widgets/common_icon_button.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';
import 'package:unknown_note_flutter/enums/enum_loading_status.dart';
import 'package:unknown_note_flutter/package/flutter_card_swiper/card_swiper.dart';
import 'package:unknown_note_flutter/pages/home/screens/diary/widgets/diary_card.dart';
import 'package:unknown_note_flutter/pages/home/screens/diary/widgets/diary_skeleton.dart';
import 'package:unknown_note_flutter/pages/home/screens/diary/widgets/diary_slide_widget.dart';

class DiaryScreen extends StatefulWidget {
  const DiaryScreen({super.key});

  @override
  State<DiaryScreen> createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  late final CardSwiperController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CardSwiperController();
    context.read<DiaryBloc>().add(DiaryGet());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onAddTap() {
    context.push('/write/diary');
  }

  void _onSettingTap() {
    DraggableMenu.open(
      context,
      const CommonDraggable(
        child: DiarySlideWidget(),
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
              if (index != 0 ||
                  state.status == ELoadingStatus.init ||
                  state.status == ELoadingStatus.loading) {
                return DiarySkeleton(seed: state.page);
              }
              return DiaryCard(diray: state.diary!);
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
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: Sizes.size80,
                right: Sizes.size32,
              ),
              child: CommonIconButton(
                icon: Icons.settings_rounded,
                onTap: _onSettingTap,
              ),
            ),
          ),
        ),
        SafeArea(
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: Sizes.size80,
                left: Sizes.size32,
              ),
              child: CommonIconButton(
                icon: Icons.add_rounded,
                onTap: _onAddTap,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
