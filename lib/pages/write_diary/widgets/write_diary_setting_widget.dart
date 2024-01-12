import 'package:flutter/material.dart';
import 'package:unknown_note_flutter/common/widgets/app_font.dart';
import 'package:unknown_note_flutter/common/widgets/common_button.dart';
import 'package:unknown_note_flutter/common/widgets/common_zoom_controller.dart';
import 'package:unknown_note_flutter/constants/gaps.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';

class WriteDiarySettingWidget extends StatefulWidget {
  // final bool isHide;
  final Function() onDelete;

  const WriteDiarySettingWidget({
    super.key,
    // required this.isHide,
    required this.onDelete,
  });

  @override
  State<WriteDiarySettingWidget> createState() =>
      _WriteDiarySettingWidgetState();
}

class _WriteDiarySettingWidgetState extends State<WriteDiarySettingWidget> {
  bool isConfirm = false;

  @override
  void didUpdateWidget(covariant WriteDiarySettingWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // if (widget.isHide) {
    //   isConfirm = false;
    // }
  }

  void _onTabDelete() {
    if (isConfirm) {
      isConfirm = false;
      widget.onDelete();
    } else {
      isConfirm = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: Sizes.size10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.text_fields_rounded,
                      color: Colors.white,
                    ),
                    Gaps.h10,
                    AppFont(
                      '내용 글자 크기',
                      color: Colors.white,
                      weight: FontWeight.w700,
                    ),
                  ],
                ),
                CommonZoomController(),
              ],
            ),
          ),
          CommonButton(
            onTap: _onTabDelete,
            color: isConfirm
                ? Colors.redAccent.withOpacity(0.6)
                : Colors.transparent,
            shadowColor: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.size10),
              child: Row(
                children: [
                  const Icon(
                    Icons.delete_forever_rounded,
                    color: Colors.white,
                  ),
                  Gaps.h10,
                  AppFont(
                    isConfirm ? '정말 모두 지울까요?' : '전체 삭제',
                    color: Colors.white,
                    weight: FontWeight.w700,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
