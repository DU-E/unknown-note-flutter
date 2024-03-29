import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unknown_note_flutter/bloc/setting/setting_bloc.dart';
import 'package:unknown_note_flutter/bloc/setting/setting_event.dart';
import 'package:unknown_note_flutter/widgets/common_icon_button.dart';
import 'package:unknown_note_flutter/constants/gaps.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';

class CommonZoomController extends StatelessWidget {
  const CommonZoomController({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(Sizes.size40),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CommonIconButton(
            icon: Icons.add_rounded,
            onTap: () {
              context.read<SettingBloc>().add(SettingZoomIn());
            },
          ),
          Gaps.h5,
          CommonIconButton(
            icon: Icons.horizontal_rule_rounded,
            onTap: () {
              context.read<SettingBloc>().add(SettingZoomOut());
            },
          ),
        ],
      ),
    );
  }
}
