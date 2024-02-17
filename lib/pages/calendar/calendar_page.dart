import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:unknown_note_flutter/bloc/calendar/calendar_bloc.dart';
import 'package:unknown_note_flutter/bloc/calendar/calendar_event.dart';
import 'package:unknown_note_flutter/bloc/calendar/calendar_state.dart';
import 'package:unknown_note_flutter/bloc/calendar/calendar_state_cubit.dart';
import 'package:unknown_note_flutter/constants/gaps.dart';
import 'package:unknown_note_flutter/constants/strings.dart';
import 'package:unknown_note_flutter/enums/enum_loading_status.dart';
import 'package:unknown_note_flutter/models/diary/diary_model.dart';
import 'package:unknown_note_flutter/widgets/app_font.dart';
import 'package:unknown_note_flutter/widgets/common_blur_container.dart';
import 'package:unknown_note_flutter/widgets/common_button.dart';
import 'package:unknown_note_flutter/widgets/common_icon_button.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';
import 'package:unknown_note_flutter/pages/calendar/widgets/calendar_title.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late final CalendarController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
    _controller.selectedDate =
        context.read<CalendarStateCubit>().state.selectedDate;
    _controller.displayDate = context.read<CalendarStateCubit>().state.headDate;
    _controller.addPropertyChangedListener(_calendarListener);
  }

  @override
  void dispose() {
    _controller.removePropertyChangedListener(_calendarListener);
    _controller.dispose();
    super.dispose();
  }

  void _calendarListener(String type) {
    if (type == 'displayDate') {
      context
          .read<CalendarStateCubit>()
          .onChangeHeadDate(_controller.displayDate);
      if (_controller.displayDate != null) {
        context.read<CalendarBloc>().add(CalendarLoadEvent(
              page: _controller.displayDate!,
            ));
      }
    }
  }

  void _onAddTap() {
    context.push('/write/diary');
  }

  void _onReadTap(DiaryModel diary) {
    context.push(
      '/diary/${diary.id}',
      extra: diary,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: Sizes.size20),
          child: AppFont(
            '감정 달력',
            size: Sizes.size20,
          ),
        ),
        BlocBuilder<CalendarStateCubit, CalendarHeaderState>(
          builder: (context, state) => CalendarTitle(
            date: state.headDate,
            gotoToday: () {
              _controller.displayDate = DateTime.now();
              _controller.selectedDate = DateTime.now();
            },
          ),
        ),
        Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(Sizes.size20),
              child: SfCalendar(
                controller: _controller,
                view: CalendarView.month,
                monthViewSettings: const MonthViewSettings(
                  showAgenda: false,
                  showTrailingAndLeadingDates: false,
                ),
                selectionDecoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: Sizes.size2,
                  ),
                  shape: BoxShape.circle,
                ),
                headerHeight: 0,
                onSelectionChanged: (calendarSelectionDetails) {
                  context
                      .read<CalendarStateCubit>()
                      .onChangeSelectedDate(calendarSelectionDetails.date);
                },
                monthCellBuilder: (context, details) =>
                    BlocBuilder<CalendarBloc, CalendarState>(
                  builder: (context, state) {
                    var status = state.status?[
                        DateTime(details.date.year, details.date.month, 1)];
                    var diary = state
                        .page?[
                            DateTime(details.date.year, details.date.month, 1)]
                        ?.diaries?[details.date];
                    // Loading
                    if (status == ELoadingStatus.loading || status == null) {
                      return Center(
                        child: AppFont(
                          details.date.day.toString(),
                          color: Colors.black.withOpacity(0.5),
                        ),
                      );
                    }
                    // Loaded and has Diary
                    if (diary != null) {
                      return Center(
                        child: Image.asset(
                          'assets/images/emotions/${diary.emotion?.key ?? 'happy'}_img.png',
                          width: Sizes.size40,
                          height: Sizes.size40,
                        ),
                      );
                    }
                    // No Diary or Error
                    return Center(
                      child: AppFont(details.date.day.toString()),
                    );
                  },
                ),
              ),
            ),
            BlocBuilder<CalendarBloc, CalendarState>(
              builder: (context, state) {
                var status = state.status?[DateTime(
                    _controller.displayDate!.year,
                    _controller.displayDate!.month,
                    1)];
                var message = state.message?[DateTime(
                    _controller.displayDate!.year,
                    _controller.displayDate!.month,
                    1)];
                if (status == ELoadingStatus.error) {
                  return Container(
                    height: MediaQuery.of(context).size.width - Sizes.size20,
                    margin: const EdgeInsets.all(Sizes.size10),
                    child: CommonBlurContainer(
                      color: Colors.transparent,
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AppFont(message ?? Strings.unknownFail),
                            Gaps.v20,
                            CommonButton(
                              onTap: () {
                                context
                                    .read<CalendarBloc>()
                                    .add(CalendarLoadEvent(
                                      page: _controller.displayDate!,
                                    ));
                              },
                              child: const AppFont('재시도'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
                return Container();
              },
            ),
          ],
        ),
        BlocBuilder<CalendarStateCubit, CalendarHeaderState>(
          builder: (context, state) {
            var diary = context
                .read<CalendarBloc>()
                .state
                .page?[DateTime(
                    state.selectedDate.year, state.selectedDate.month, 1)]
                ?.diaries?[state.selectedDate];
            if (diary != null) {
              return CommonButton(
                onTap: () => _onReadTap(diary),
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
              onTap: _onAddTap,
            );
          },
        ),
      ],
    );
  }
}
