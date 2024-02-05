import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum EEssayCategory {
  poem('poem', '시', FontAwesomeIcons.quoteRight),
  novel('novel', '소설', FontAwesomeIcons.bookJournalWhills),
  whisper('whisper', '귓속말', FontAwesomeIcons.commentDots),
  subs('subs', '구독한 프로필의 수필', Icons.person_add_alt_1_rounded),
  favs('favs', '즐겨찾기한 수필', Icons.star_rounded);

  final String key;
  final String title;
  final IconData icon;

  const EEssayCategory(this.key, this.title, this.icon);
}
