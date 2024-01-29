import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unknown_note_flutter/bloc/essay/essay_list_bloc.dart';
import 'package:unknown_note_flutter/bloc/essay/essay_list_state.dart';
import 'package:unknown_note_flutter/widgets/app_font.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';
import 'package:unknown_note_flutter/widgets/common_blur_container.dart';

class EssayAppBar extends StatelessWidget {
  const EssayAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonBlurContainer(
      child: BlocBuilder<EssayListBloc, EssayListState>(
        builder: (context, state) => Center(
          child: AppFont(
            state.category.title,
            color: Colors.white,
            size: Sizes.size16,
            weight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
