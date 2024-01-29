import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unknown_note_flutter/bloc/home/home_screen_cubit.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';
import 'package:unknown_note_flutter/enums/enum_home_screen.dart';
import 'package:unknown_note_flutter/pages/calendar/calendar_page.dart';
import 'package:unknown_note_flutter/pages/diary/diary_page.dart';
import 'package:unknown_note_flutter/pages/essay/essay_page.dart';
import 'package:unknown_note_flutter/pages/user_info/user_info_page.dart';
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
      length: 4,
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
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: AppBar(
                backgroundColor:
                    Theme.of(context).primaryColor.withOpacity(0.6),
                foregroundColor: Colors.white,
              ),
            ),
            body: SafeArea(
              top: true,
              bottom: false,
              child: TabBarView(
                controller: _controller,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  CalendarPage(),
                  DiaryPage(),
                  EssayPage(),
                  UserInfoPage(),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: Sizes.size20,
              right: Sizes.size20,
              bottom: MediaQuery.of(context).padding.bottom + Sizes.size18,
            ),
            child: const HomeNavigationBar(),
          ),
        ],
      ),
    );
  }
}
