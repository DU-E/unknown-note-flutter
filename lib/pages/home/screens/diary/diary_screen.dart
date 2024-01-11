import 'package:flutter/material.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';
import 'package:unknown_note_flutter/package/flutter_card_swiper/card_swiper.dart';
import 'package:unknown_note_flutter/pages/home/screens/diary/widgets/diary_card.dart';

class DiaryScreen extends StatefulWidget {
  const DiaryScreen({super.key});

  @override
  State<DiaryScreen> createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  late CardSwiperController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CardSwiperController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CardSwiper(
      cardsCount: candidates.length,
      threshold: 200,
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).padding.bottom + Sizes.size60,
      ),
      cardBuilder: (context, index, _, __) => DiaryCard(
        candidate: candidates[index],
      ),
      onSwipe: (previousIndex, currentIndex, direction) {
        _controller.undo();
        return false;
      },
    );
  }
}
