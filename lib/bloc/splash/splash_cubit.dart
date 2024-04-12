import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unknown_note_flutter/enums/enum_splash.dart';

class SplashCubit extends Cubit<ESplash> {
  SplashCubit() : super(ESplash.init);

  void setSplash(ESplash splash) => emit(splash);
}
