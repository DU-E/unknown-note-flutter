import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unknown_note_flutter/bloc/diary/diary_list_bloc.dart';
import 'package:unknown_note_flutter/bloc/diary/diary_list_event.dart';
import 'package:unknown_note_flutter/bloc/diary/diary_list_state.dart';
import 'package:unknown_note_flutter/common/widgets/app_font.dart';
import 'package:unknown_note_flutter/constants/gaps.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';
import 'package:unknown_note_flutter/enums/enum_diary_category.dart';
import 'package:unknown_note_flutter/enums/enum_loading_status.dart';

class DiaryCategoryButton extends StatelessWidget {
  final EDiaryCategory category;

  const DiaryCategoryButton({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiaryListBloc, DiaryListState>(
      builder: (context, state) => ElevatedButton(
        onPressed: () {
          if (state.category != category &&
              state.status != ELoadingStatus.loading) {
            context.read<DiaryListBloc>().add(DiaryListChangeCategory(
                  category: category,
                ));
          }
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size3,
          ),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              Sizes.size5,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(category.icon),
                  Gaps.h10,
                  AppFont(
                    category.title,
                    weight: FontWeight.w700,
                  ),
                ],
              ),
              if (state.category == category) const AppFont('선택됨'),
            ],
          ),
        ),
      ),
    );
  }
}
