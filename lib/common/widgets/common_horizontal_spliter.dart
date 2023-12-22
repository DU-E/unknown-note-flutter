import 'package:flutter/material.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';

class CommonHorizontalSpliter extends StatelessWidget {
  const CommonHorizontalSpliter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Sizes.size1,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.6),
        borderRadius: BorderRadius.circular(Sizes.size5),
      ),
    );
  }
}
