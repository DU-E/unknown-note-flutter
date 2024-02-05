import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unknown_note_flutter/bloc/setting/setting_bloc.dart';
import 'package:unknown_note_flutter/bloc/setting/setting_state.dart';
import 'package:unknown_note_flutter/widgets/common_shadow_container.dart';
import 'package:unknown_note_flutter/constants/gaps.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';

class DiarySkeleton extends StatelessWidget {
  final int seed;

  const DiarySkeleton({
    super.key,
    required this.seed,
  });

  @override
  Widget build(BuildContext context) {
    return CommonShadowContainer(
      child: Padding(
        padding: const EdgeInsets.all(Sizes.size20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Container(
                    width: Sizes.size64,
                    height: Sizes.size64,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Gaps.v10,
                  _rowSkeleton(width: 100),
                  _rowSkeleton(width: 50),
                  Gaps.v20,
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var w in List.generate(
                    Random(seed).nextInt(10) + 5,
                    (index) =>
                        Random(seed * 100 + index).nextDouble() *
                            (MediaQuery.of(context).size.width - 200) +
                        100))
                  BlocBuilder<SettingBloc, SettingState>(
                    builder: (context, state) => _rowSkeleton(
                      width: w,
                      height: state.getZoom(),
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _rowSkeleton({
    double width = double.infinity,
    double height = Sizes.size10,
  }) =>
      Container(
        margin: const EdgeInsets.only(bottom: Sizes.size10),
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(Sizes.size10),
        ),
      );
}
