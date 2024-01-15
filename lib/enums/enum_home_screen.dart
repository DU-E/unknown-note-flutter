import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum EHomeScreen {
  calendar('캘린더', FontAwesomeIcons.calendar, 0),
  diary('일기', FontAwesomeIcons.bookOpen, 1),
  essay('수필', FontAwesomeIcons.penFancy, 2),
  myInfo('내 정보', Icons.person_rounded, 3);

  final String title;
  final IconData icon;
  final int idx;

  const EHomeScreen(
    this.title,
    this.icon,
    this.idx,
  );
}
