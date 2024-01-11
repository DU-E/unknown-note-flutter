import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:unknown_note_flutter/bloc/calendar/calendar_state_cubit.dart';
import 'package:unknown_note_flutter/common/widgets/app_font.dart';
import 'package:unknown_note_flutter/common/widgets/common_icon_button.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';
import 'package:unknown_note_flutter/pages/home/screens/calendar/widgets/calendar_title.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late final CalendarController _controller;
  DateTime? headerDate;

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
            ),
            headerHeight: 0,
            onSelectionChanged: (calendarSelectionDetails) {
              context
                  .read<CalendarStateCubit>()
                  .onChangeSelectedDate(calendarSelectionDetails.date);
            },
            // loadMoreWidgetBuilder: (context, loadMoreAppointments) {},
            monthCellBuilder: (context, details) => SizedBox(
              height: details.bounds.height,
              child: Center(
                child: AppFont(details.date.day.toString()),
              ),
            ),
          ),
        ),
        CommonIconButton(
          icon: Icons.add,
          onTap: () {
            print(_controller.selectedDate);
          },
        ),
      ],
    );
  }
}
