import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum EAuthMethod {
  google('GOOGLE', FontAwesomeIcons.google),
  naver('NAVER', FontAwesomeIcons.n),
  kakao('KAKAO', FontAwesomeIcons.k);

  final String key;
  final IconData icon;

  const EAuthMethod(
    this.key,
    this.icon,
  );
}
