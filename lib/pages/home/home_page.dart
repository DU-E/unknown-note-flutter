import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unknown_note_flutter/bloc/home/home_screen_cubit.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';
import 'package:unknown_note_flutter/enums/enum_home_screen.dart';
import 'package:unknown_note_flutter/pages/home/diary/diary_screen.dart';
import 'package:unknown_note_flutter/pages/home/essay/essay_screen.dart';
import 'package:unknown_note_flutter/pages/home/mypage/mypage_screen.dart';
import 'package:unknown_note_flutter/pages/home/widgets/home_navigaton_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: 3,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeScreenCubit, EHomeScreen>(
      listener: (context, state) {
        _controller.index = state.idx;
      },
      child: Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            TabBarView(
              controller: _controller,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                EssayScreen(),
                DiaryScreen(),
                MypageScreen(),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                left: Sizes.size20,
                right: Sizes.size20,
                bottom: MediaQuery.of(context).padding.bottom,
              ),
              child: const HomeNavigationBar(),
            ),
          ],
        ),
      ),
    );
  }
}
