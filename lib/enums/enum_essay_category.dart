import 'package:flutter/material.dart';

enum EEssayCategory {
  recomm('맞춤 추천', Icons.fitbit_outlined),
  mood('감성 추천', Icons.mood_rounded),
  recent('최신 순', Icons.timelapse_rounded),
  rate('좋아요 순', Icons.favorite_rounded),
  random('무작위', Icons.shuffle_rounded);

  final String title;
  final IconData icon;

  const EEssayCategory(this.title, this.icon);
}
