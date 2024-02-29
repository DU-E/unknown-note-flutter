import 'package:flutter/material.dart';

enum EEmotion {
  happy('happy', '행복', Color(0xFFFEFA7F)),
  love('love', '사랑', Color(0xFFED9189)),
  expect('expect', '기대감', Color(0xFFA0D07C)),
  thanks('thanks', '감사', Color(0xFFF2B666)),
  sad('sad', '슬픔', Color(0xFF2D65EC)),
  anger('anger', '분노', Color(0xFFE84E37)),
  fear('fear', '두려움', Color(0xFF8257EB)),
  regret('regret', '후회', Color(0xFFB448E2));

  final String key;
  final String text;
  final Color color;

  const EEmotion(
    this.key,
    this.text,
    this.color,
  );
}
