import 'package:flutter/material.dart';
import 'package:unknown_note_flutter/widgets/app_font.dart';

class MyinfoScreen extends StatelessWidget {
  const MyinfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: Colors.yellow,
        child: const Center(
          child: AppFont('mypage'),
        ),
      ),
    );
  }
}
