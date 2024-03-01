import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:unknown_note_flutter/bloc/calendar/calendar_bloc.dart';
import 'package:unknown_note_flutter/bloc/calendar/calendar_state.dart';
import 'package:unknown_note_flutter/bloc/calendar/calendar_state_cubit.dart';
import 'package:unknown_note_flutter/constants/gaps.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';
import 'package:unknown_note_flutter/enums/enum_loading_status.dart';
import 'package:unknown_note_flutter/models/diary/diary_model.dart';
import 'package:unknown_note_flutter/widgets/app_font.dart';
import 'package:unknown_note_flutter/widgets/common_button.dart';
import 'package:unknown_note_flutter/widgets/common_icon_button.dart';

class CalendarAddButton extends StatelessWidget {
  const CalendarAddButton({super.key});

  void _onAddTap(BuildContext context) {
    context.push('/write/diary');
  }

  void _onReadTap(
    BuildContext context, {
    required DiaryModel diary,
  }) {
    context.push(
      '/diary/${diary.id}',
      extra: diary,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarBloc, CalendarState>(
      builder: (context, state) {
        var calendarState = context.watch<CalendarStateCubit>().state;
        var diary = state
            .page?[DateTime(calendarState.selectedDate.year,
                calendarState.selectedDate.month, 1)]
            ?.diaries?[calendarState.selectedDate];

        if (diary != null) {
          return CommonButton(
            onTap: () => _onReadTap(context, diary: diary),
            borderRadius: Sizes.size40,
            color: Theme.of(context).primaryColor.withOpacity(0.6),
            foregroundColor: Colors.white,
            shadowColor: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size16,
                vertical: Sizes.size8,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/emotions/${diary.emotion?.key ?? 'happy'}_img.png',
                    width: Sizes.size32,
                    height: Sizes.size32,
                  ),
                  Gaps.h10,
                  AppFont('${diary.time?.day}일 일기 읽기'),
                ],
              ),
            ),
          );
        }
        return CommonIconButton(
          icon: Icons.add,
          onTap: state.status?[DateTime(calendarState.selectedDate.year,
                      calendarState.selectedDate.month, 1)] ==
                  ELoadingStatus.loaded
              ? () => _onAddTap(context)
              : null,
        );
      },
    );
  }
}
