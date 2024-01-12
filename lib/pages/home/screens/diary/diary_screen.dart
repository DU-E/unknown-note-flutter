import 'package:draggable_menu/draggable_menu.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:unknown_note_flutter/common/widgets/common_draggable.dart';
import 'package:unknown_note_flutter/common/widgets/common_font_controller.dart';
import 'package:unknown_note_flutter/common/widgets/common_icon_button.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';
import 'package:unknown_note_flutter/package/flutter_card_swiper/card_swiper.dart';
import 'package:unknown_note_flutter/pages/home/screens/diary/widgets/diary_skeleton.dart';
import 'package:unknown_note_flutter/pages/home/screens/diary/widgets/diary_slide_widget.dart';

class DiaryScreen extends StatefulWidget {
  const DiaryScreen({super.key});

  @override
  State<DiaryScreen> createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen>
    with SingleTickerProviderStateMixin {
  late final CardSwiperController _controller;
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _controller = CardSwiperController();
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _tabController.dispose();
    super.dispose();
  }

  void _onAddTap() {
    context.push('/write/diary');
  }

  void _onSettingTap() {
    DraggableMenu.open(
      context,
      CommonDraggable(
        initHeight: 400,
        child: DiarySlideWidget(
          tabController: _tabController,
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
          cardBuilder: (context, index, _, __) => DiarySkeleton(
            seed: index,
          ),
          onSwipe: (previousIndex, currentIndex, direction) {
            return true;
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
