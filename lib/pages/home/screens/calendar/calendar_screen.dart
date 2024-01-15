import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:unknown_note_flutter/bloc/calendar/calendar_state_cubit.dart';
import 'package:unknown_note_flutter/widgets/app_font.dart';
import 'package:unknown_note_flutter/widgets/common_icon_button.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';
import 'package:unknown_note_flutter/pages/home/screens/calendar/widgets/calendar_title.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
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
    }
  }

  void _onAddTap() {
    print(_controller.selectedDate);
    context.push('/write/diary');
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
            // loadMoreWidgetBuilder: (context, loadMoreAppointments) {},
            monthCellBuilder: (context, details) => Center(
              child: AppFont(details.date.day.toString()),
            ),
          ),
        ),
        CommonIconButton(
          icon: Icons.add,
          onTap: _onAddTap,
        ),
      ],
    );
  }
}
