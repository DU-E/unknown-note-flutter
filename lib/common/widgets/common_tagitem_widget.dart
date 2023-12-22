import 'package:flutter/material.dart';
import 'package:unknown_note_flutter/common/widgets/app_font.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';

class CommonTagItemWidget extends StatelessWidget {
  final String tag;

  const CommonTagItemWidget({
    super.key,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(Sizes.size3),
      ),
      padding: const EdgeInsets.symmetric(horizontal: Sizes.size4),
      child: AppFont(
        tag,
        color: Colors.white,
        size: Sizes.size12,
      ),
    );
  }
}
