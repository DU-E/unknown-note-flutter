abstract class CalendarEvent {}

class CalendarLoadEvent extends CalendarEvent {
  final DateTime page;

  CalendarLoadEvent({
    required this.page,
  });
}
