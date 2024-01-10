import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:unknown_note_flutter/common/widgets/app_font.dart';
import 'package:unknown_note_flutter/common/widgets/common_button.dart';
import 'package:unknown_note_flutter/constants/gaps.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';
import 'package:unknown_note_flutter/models/diary/diary_model.dart';
import 'package:unknown_note_flutter/common/widgets/common_tagitem_widget.dart';

class DiaryListItemWidget extends StatelessWidget {
  final DiaryModel diary;

  const DiaryListItemWidget({
    super.key,
    required this.diary,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.size10),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.3),
            spreadRadius: Sizes.size1,
            blurRadius: Sizes.size3,
          ),
        ],
      ),
      child: CommonButton(
        onTap: () => context.push(
          '/diary/${diary.id}',
          extra: diary,
        ),
        shadowColor: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(Sizes.size10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppFont(
                    diary.author ?? 'Anonymous',
                    color: Theme.of(context).primaryColor,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(Sizes.size3),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.size3,
                      vertical: Sizes.size1,
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.favorite_rounded,
                          size: Sizes.size16,
                          color: Colors.white,
                        ),
                        Gaps.h2,
                        AppFont(
                          diary.likes?.toString() ?? '0',
                          color: Colors.white,
                          size: Sizes.size12,
                          weight: FontWeight.w900,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Gaps.v5,
              if (diary.title != null)
                AppFont(
                  diary.title!,
                  weight: FontWeight.w700,
                  size: Sizes.size16,
                ),
              AppFont(diary.body ?? ''),
              Gaps.v5,
              Wrap(
                spacing: Sizes.size4,
                runSpacing: Sizes.size4,
                children: [
                  for (var tag in diary.tags ?? [])
                    CommonTagItemWidget(
                      tag: tag,
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
