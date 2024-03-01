import 'package:flutter/material.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';
import 'package:unknown_note_flutter/widgets/app_font.dart';

class UserEditPage extends StatelessWidget {
  final bool popAble;

  const UserEditPage({
    super.key,
    this.popAble = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.6),
        surfaceTintColor: Colors.transparent,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const AppFont(
          '프로필 설정',
          size: Sizes.size16,
        ),
        leading: popAble ? null : const SizedBox(),
      ),
      body: const Center(
        child: AppFont('edit profile'),
      ),
    );
  }
}
