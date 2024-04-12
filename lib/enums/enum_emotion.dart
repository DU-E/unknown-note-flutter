import 'package:flutter/material.dart';
import 'package:unknown_note_flutter/utils/flower_provider.dart';

enum EEmotion {
  happy('happy', '행복', Color(0xFFFEFA7F), FlowerProvider.happy),
  love('love', '사랑', Color(0xFFED9189), FlowerProvider.love),
  expect('expect', '기대감', Color(0xFFA0D07C), FlowerProvider.expect),
  thanks('thanks', '감사', Color(0xFFF2B666), FlowerProvider.thanks),
  sad('sad', '슬픔', Color(0xFF2D65EC), FlowerProvider.sad),
  anger('anger', '분노', Color(0xFFE84E37), FlowerProvider.anger),
  fear('fear', '두려움', Color(0xFF8257EB), FlowerProvider.fear),
  regret('regret', '후회', Color(0xFFB448E2), FlowerProvider.regret);

  final String key;
  final String text;
  final Color color;
  final Flower data;

  const EEmotion(
    this.key,
    this.text,
    this.color,
    this.data,
  );
}
