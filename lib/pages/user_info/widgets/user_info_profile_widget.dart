import 'package:flutter/material.dart';
import 'package:unknown_note_flutter/constants/gaps.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';
import 'package:unknown_note_flutter/constants/strings.dart';
import 'package:unknown_note_flutter/enums/enum_loading_status.dart';
import 'package:unknown_note_flutter/models/user/user_model.dart';
import 'package:unknown_note_flutter/widgets/app_font.dart';
import 'dart:math' as math;

class UserInfoProfileWidget extends StatelessWidget {
  final String? nickName;
  final UserModel user;
  final int diaryCount;
  final int essayCount;
  final ELoadingStatus status;

  const UserInfoProfileWidget({
    super.key,
    this.nickName,
    required this.user,
    required this.diaryCount,
    required this.essayCount,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          color: Colors.red,
        ),
        Container(
          color: Theme.of(context).primaryColor.withOpacity(0.6),
          child: Padding(
            padding: const EdgeInsets.only(
              top: Sizes.size32,
              bottom: Sizes.size10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Flexible(
                  flex: 2,
                  child: _infoText(
                    title: '일기',
                    value: status == ELoadingStatus.loading
                        ? '-'
                        : diaryCount.toString(),
                  ),
                ),
                _verticalDivider(),
                Flexible(
                  flex: 3,
                  child: _infoText(
                    title: '닉네임',
                    value: nickName ??
                        user.nickName ??
                        (status == ELoadingStatus.loading
                            ? '-'
                            : Strings.nullStr),
                    size: Sizes.size14,
                  ),
                ),
                _verticalDivider(),
                Flexible(
                  flex: 2,
                  child: _infoText(
                    title: '수필',
                    value: status == ELoadingStatus.loading
                        ? '-'
                        : essayCount.toString(),
                  ),
                ),
              ],
            ),
          ),
        ),
        Transform.translate(
          offset: const Offset(0, -Sizes.size72),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Transform.translate(
                    offset: const Offset(0, Sizes.size8),
                    child: Transform.rotate(
                      angle: math.pi / 4,
                      child: Container(
                        width: Sizes.size20,
                        height: Sizes.size20,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: Sizes.size10,
                      horizontal: Sizes.size16,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade700,
                      borderRadius: BorderRadius.circular(Sizes.size5),
                    ),
                    child: AppFont(
                      user.introduce ??
                          (status == ELoadingStatus.loading
                              ? '잠시만 기다려주세요~'
                              : Strings.nullStr),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Gaps.v20,
              const CircleAvatar(radius: Sizes.size40),
            ],
          ),
        ),
      ],
    );
  }

  Widget _verticalDivider() {
    return Container(
      width: Sizes.size1,
      height: Sizes.size20,
      color: Colors.grey.shade400,
    );
  }

  Widget _infoText({
    required String title,
    required String value,
    double? size,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppFont(
          title,
          size: Sizes.size16,
          color: Colors.white,
        ),
        SizedBox(
          height: Sizes.size32,
          child: Center(
            child: AppFont(
              value,
              size: size ?? Sizes.size20,
              color: Colors.white,
              weight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
