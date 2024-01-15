import 'package:flutter/material.dart';
import 'package:unknown_note_flutter/widgets/app_font.dart';
import 'package:unknown_note_flutter/widgets/common_font_controller.dart';
import 'package:unknown_note_flutter/widgets/common_horizontal_spliter.dart';
import 'package:unknown_note_flutter/widgets/common_radio_button.dart';
import 'package:unknown_note_flutter/widgets/common_zoom_controller.dart';
import 'package:unknown_note_flutter/constants/gaps.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';
import 'package:unknown_note_flutter/pages/home/screens/essay/widgets/essay_slide_widget.dart';

class DiarySlideWidget extends StatefulWidget {
  const DiarySlideWidget({super.key});

  @override
  State<DiarySlideWidget> createState() => _DiarySlideWidgetState();
}

class _DiarySlideWidgetState extends State<DiarySlideWidget>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 260),
      curve: Curves.easeOut,
      height: _tabController.index == 0 ? 230 : 380,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(),
      child: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(),
        clipBehavior: Clip.hardEdge,
        children: [
          _tabMain(),
          _tabSub(
            const EssaySlideWidget(),
          ),
          _tabSub(
            const CommonFontController(),
          ),
        ],
      ),
    );
  }

  Widget _tabSub(Widget child) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gaps.v10,
          child,
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: Sizes.size32),
            child: CommonHorizontalSpliter(
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: Sizes.size10,
              left: Sizes.size20,
              right: Sizes.size20,
            ),
            child: CommonRadioButton(
              icon: Icons.check_rounded,
              onTap: () {
                setState(() {
                  _tabController.index = 0;
                });
              },
              title: '완료',
              color: Colors.green.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tabMain() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.size20,
        horizontal: Sizes.size20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(
                Icons.settings_rounded,
                color: Colors.white,
                size: Sizes.size28,
              ),
              Gaps.h5,
              AppFont(
                '설정',
                color: Colors.white,
                size: Sizes.size16,
                weight: FontWeight.w700,
              ),
            ],
          ),
          Gaps.v10,
          CommonRadioButton(
            title: '감정 필터',
            icon: Icons.emoji_emotions_rounded,
            onTap: () {
              setState(() {
                _tabController.index = 1;
              });
            },
          ),
          CommonRadioButton(
            title: '글꼴',
            icon: Icons.font_download_rounded,
            onTap: () {
              setState(() {
                _tabController.index = 2;
              });
            },
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: Sizes.size10),
                child: Row(
                  children: [
                    Icon(
                      Icons.format_size_rounded,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: Sizes.size10),
                      child: AppFont(
                        '글자 크기',
                        color: Colors.white,
                        weight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              CommonZoomController(),
            ],
          ),
        ],
      ),
    );
  }
}
