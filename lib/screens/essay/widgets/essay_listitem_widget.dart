import 'package:flutter/material.dart';
import 'package:unknown_note_flutter/common/widgets/app_font.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';
import 'package:unknown_note_flutter/models/essay/essay_model.dart';

class EssayListItemWidget extends StatelessWidget {
  final EssayModel essay;

  const EssayListItemWidget({
    super.key,
    required this.essay,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).primaryColor,
        ),
        borderRadius: BorderRadius.circular(Sizes.size5),
      ),
      padding: const EdgeInsets.all(Sizes.size10),
      child: AppFont(
        essay.id.toString(),
      ),
    );
  }
}
