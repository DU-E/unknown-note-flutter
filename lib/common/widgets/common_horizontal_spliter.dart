import 'package:flutter/material.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';

class CommonHorizontalSpliter extends StatelessWidget {
  final Color? color;

  const CommonHorizontalSpliter({
    super.key,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Sizes.size1,
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).primaryColor.withOpacity(0.6),
        borderRadius: BorderRadius.circular(Sizes.size5),
      ),
    );
  }
}
