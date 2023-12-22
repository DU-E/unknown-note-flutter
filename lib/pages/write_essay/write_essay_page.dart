import 'package:flutter/material.dart';
import 'package:unknown_note_flutter/common/widgets/app_font.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';

class WriteEssayPage extends StatelessWidget {
  const WriteEssayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppFont(
          '수필 작성',
          size: Sizes.size20,
        ),
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.6),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: const Center(),
    );
  }
}
