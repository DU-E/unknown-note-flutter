import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:unknown_note_flutter/common/widgets/app_font.dart';
import 'package:unknown_note_flutter/common/widgets/common_icon_button.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';

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
    _controller.selectedDate = DateTime.now();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: Sizes.size20),
          child: AppFont(
            '감정 달력',
            size: Sizes.size20,
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.width + 20,
          padding: const EdgeInsets.all(Sizes.size20),
          child: SfCalendar(
            controller: _controller,
            view: CalendarView.month,
            monthViewSettings: const MonthViewSettings(
              showAgenda: false,
            ),
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
