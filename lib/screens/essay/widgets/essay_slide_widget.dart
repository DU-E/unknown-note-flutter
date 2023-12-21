import 'package:flutter/material.dart';
import 'package:unknown_note_flutter/common/widgets/app_font.dart';

class EssaySlideWidget extends StatelessWidget {
  const EssaySlideWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppFont('Item1'),
          AppFont('Item2'),
          AppFont('Item3'),
          AppFont('Item4'),
          AppFont('Item5'),
          AppFont('Item6'),
        ],
      ),
    );
  }
}
