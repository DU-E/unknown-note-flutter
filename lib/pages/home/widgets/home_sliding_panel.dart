import 'package:flutter/material.dart';
import 'package:unknown_note_flutter/common/widgets/app_font.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';

class HomeSlidingPanel extends StatelessWidget {
  const HomeSlidingPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      color: Theme.of(context).primaryColor.withOpacity(0.6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            color: Colors.amber,
            height: Sizes.size32,
            child: const AppFont('Drag'),
          ),
          const Expanded(
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
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
            ),
          ),
        ],
      ),
    );
  }
}
