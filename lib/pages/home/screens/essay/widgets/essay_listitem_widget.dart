import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:unknown_note_flutter/common/widgets/app_font.dart';
import 'package:unknown_note_flutter/common/widgets/common_button.dart';
import 'package:unknown_note_flutter/constants/gaps.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';
import 'package:unknown_note_flutter/models/essay/essay_model.dart';
import 'package:unknown_note_flutter/common/widgets/common_tagitem_widget.dart';

class EssayListItemWidget extends StatelessWidget {
  final EssayModel essay;

  const EssayListItemWidget({
    super.key,
    required this.essay,
  });

  @override
  Widget build(BuildContext context) {
    return CommonButton(
      onTap: () {
        context.push(
          '/essay/${essay.id}',
          extra: essay,
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(Sizes.size10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppFont(
                  essay.author ?? 'Anonymous',
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
                        essay.likes?.toString() ?? '0',
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
            if (essay.title != null)
              AppFont(
                essay.title!,
                weight: FontWeight.w700,
                size: Sizes.size16,
              ),
            AppFont(essay.body ?? ''),
            Gaps.v5,
            Wrap(
              spacing: Sizes.size4,
              runSpacing: Sizes.size4,
              children: [
                for (var tag in essay.tags ?? [])
                  CommonTagItemWidget(
                    tag: tag,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
