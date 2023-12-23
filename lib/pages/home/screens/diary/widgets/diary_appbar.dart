import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unknown_note_flutter/bloc/diary/diary_list_bloc.dart';
import 'package:unknown_note_flutter/bloc/diary/diary_list_state.dart';
import 'package:unknown_note_flutter/common/widgets/app_font.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';

class DiaryAppBar extends StatelessWidget {
  const DiaryAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: double.infinity,
          height: Sizes.size56,
          color: Theme.of(context).primaryColor.withOpacity(0.6),
          child: BlocBuilder<DiaryListBloc, DiaryListState>(
            builder: (context, state) => Center(
              child: AppFont(
                '${state.category.title} 일기',
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
