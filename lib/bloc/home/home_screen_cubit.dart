import 'package:bloc/bloc.dart';
import 'package:unknown_note_flutter/enums/enum_home_screen.dart';

class HomeScreenCubit extends Cubit<EHomeScreen> {
  HomeScreenCubit() : super(EHomeScreen.calendar);

  void setScreen(EHomeScreen screen) => emit(screen);
}
