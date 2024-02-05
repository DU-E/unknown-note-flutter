import 'package:intl/intl.dart';
import 'package:unknown_note_flutter/constants/strings.dart';

String dateToYMD(DateTime? dateTime) {
  if (dateTime == null) return Strings.nullStr;
  return '${dateTime.year}년 ${dateTime.month}월 ${dateTime.day}일';
}

String dateToE(DateTime? dateTime) {
  if (dateTime == null) return Strings.nullStr;
  return '${DateFormat('E', 'ko_KR').format(dateTime)}요일';
}
