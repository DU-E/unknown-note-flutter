import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:unknown_note_flutter/constants/gaps.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';
import 'package:unknown_note_flutter/widgets/app_font.dart';
import 'package:unknown_note_flutter/widgets/common_button.dart';

class SignoutDialog extends StatelessWidget {
  const SignoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      content: Container(
        padding: const EdgeInsets.only(top: Sizes.size20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Sizes.size10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: Sizes.size20),
              child: Row(
                children: [
                  Icon(
                    Icons.logout_rounded,
                    color: Colors.redAccent,
                  ),
                  Gaps.h10,
                  AppFont(
                    '로그아웃 할까요?',
                    size: Sizes.size16,
                  ),
                ],
              ),
            ),
            Gaps.v10,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.size5),
              child: Row(
                children: [
                  Expanded(
                    child: CommonButton(
                      color: Colors.white,
                      shadowColor: Colors.transparent,
                      onTap: () {
                        context.pop();
                      },
                      child: const Center(
                        child: AppFont('취소'),
                      ),
                    ),
                  ),
                  Gaps.h10,
                  Expanded(
                    child: CommonButton(
                      color: Colors.white,
                      shadowColor: Colors.transparent,
                      onTap: () {
                        context.pop<bool>(true);
                      },
                      child: const Center(
                        child: AppFont(
                          '로그아웃',
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
