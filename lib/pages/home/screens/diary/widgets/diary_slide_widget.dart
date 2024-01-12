import 'package:flutter/material.dart';
import 'package:unknown_note_flutter/common/widgets/app_font.dart';
import 'package:unknown_note_flutter/common/widgets/common_font_controller.dart';
import 'package:unknown_note_flutter/common/widgets/common_radio_button.dart';
import 'package:unknown_note_flutter/common/widgets/common_zoom_controller.dart';
import 'package:unknown_note_flutter/constants/gaps.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';
import 'package:unknown_note_flutter/pages/home/screens/essay/widgets/essay_slide_widget.dart';

class DiarySlideWidget extends StatefulWidget {
  final TabController tabController;

  const DiarySlideWidget({
    super.key,
    required this.tabController,
  });

  @override
  State<DiarySlideWidget> createState() => _DiarySlideWidgetState();
}

class _DiarySlideWidgetState extends State<DiarySlideWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: TabBarView(
        controller: widget.tabController,
        physics: const NeverScrollableScrollPhysics(),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: Sizes.size5,
            left: Sizes.size10,
          ),
          child: GestureDetector(
            onTap: () {
              setState(() {
                widget.tabController.index = 0;
              });
            },
            child: const Icon(
              Icons.keyboard_arrow_left_rounded,
              color: Colors.white,
              size: Sizes.size40,
            ),
          ),
        ),
        child,
      ],
    );
  }

  Widget _tabMain() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.size10,
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
                widget.tabController.index = 1;
              });
            },
          ),
          CommonRadioButton(
            title: '글꼴',
            icon: Icons.font_download_rounded,
            onTap: () {
              setState(() {
                widget.tabController.index = 2;
              });
            },
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: Sizes.size10),
                child: AppFont(
                  '글자 크기',
                  color: Colors.white,
                  weight: FontWeight.w700,
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
