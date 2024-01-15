import 'package:unknown_note_flutter/enums/enum_font.dart';

abstract class SettingEvent {}

class SettingZoomIn extends SettingEvent {}

class SettingZoomOut extends SettingEvent {}

class SettingFont extends SettingEvent {
  EFont font;

  SettingFont(this.font);
}
