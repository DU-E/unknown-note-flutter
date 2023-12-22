import 'package:flutter/material.dart';
import 'package:unknown_note_flutter/common/widgets/app_font.dart';

class DiaryScreen extends StatelessWidget {
  const DiaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: Colors.yellow,
        child: const Center(
          child: AppFont('diary'),
        ),
      ),
    );
  }
}
