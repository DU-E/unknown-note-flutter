import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unknown_note_flutter/bloc/essay/essay_list_bloc.dart';
import 'package:unknown_note_flutter/bloc/essay/essay_list_state.dart';
import 'package:unknown_note_flutter/common/widgets/app_font.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';

class EssayAppBar extends StatelessWidget {
  const EssayAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: double.infinity,
          height: Sizes.size52,
          color: Theme.of(context).primaryColor.withOpacity(0.6),
          child: BlocBuilder<EssayListBloc, EssayListState>(
            builder: (context, state) => Center(
              child: AppFont(
                '${state.category.title} 수필',
                color: Colors.white,
                size: Sizes.size16,
                weight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
