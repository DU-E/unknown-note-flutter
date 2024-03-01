import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalendarStateCubit extends Cubit<CalendarHeaderState> {
  CalendarStateCubit()
      : super(CalendarHeaderState(
          headDate: DateTime.now(),
          selectedDate: DateTime(DateTime.now().year, DateTime.now().month, 1),
        ));

  void onChangeHeadDate(DateTime? date) {
    if (date == null) return;
    emit(state.copyWith(headDate: date));
  }

  void onChangeSelectedDate(DateTime? date) {
    if (date == null) return;
    emit(state.copyWith(selectedDate: date));
  }
}

class CalendarHeaderState extends Equatable {
  final DateTime headDate;
  final DateTime selectedDate;

  const CalendarHeaderState({
    required this.headDate,
    required this.selectedDate,
  });

  CalendarHeaderState copyWith({
    DateTime? headDate,
    DateTime? selectedDate,
  }) =>
      CalendarHeaderState(
        headDate: headDate ?? this.headDate,
        selectedDate: selectedDate ?? this.selectedDate,
      );

  @override
  List<Object?> get props => [
        headDate,
        selectedDate,
      ];
}
