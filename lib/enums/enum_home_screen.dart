import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum EHomeScreen {
  essay('수필', FontAwesomeIcons.penFancy, 0),
  diary('일기', FontAwesomeIcons.bookOpen, 1),
  myInfo('내 정보', Icons.person_rounded, 2);

  final String title;
  final IconData icon;
  final int idx;

  const EHomeScreen(
    this.title,
    this.icon,
    this.idx,
  );
}
