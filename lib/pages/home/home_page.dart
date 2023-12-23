import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unknown_note_flutter/bloc/home/home_screen_cubit.dart';
import 'package:unknown_note_flutter/common/widgets/common_slide_up_panel.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';
import 'package:unknown_note_flutter/enums/enum_home_screen.dart';
import 'package:unknown_note_flutter/pages/home/screens/diary/diary_screen.dart';
import 'package:unknown_note_flutter/pages/home/screens/diary/widgets/diary_slide_widget.dart';
import 'package:unknown_note_flutter/pages/home/screens/essay/essay_screen.dart';
import 'package:unknown_note_flutter/pages/home/screens/essay/widgets/essay_slide_widget.dart';
import 'package:unknown_note_flutter/pages/home/screens/myinfo/myinfo_screen.dart';
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
      child: CommonSlideUpPanel(
        minimumHeight: 400,
        slideBuilder: (controller) => BlocBuilder<HomeScreenCubit, EHomeScreen>(
          builder: (context, state) {
            if (state == EHomeScreen.essay) return const EssaySlideWidget();
            return const DiarySlideWidget();
          },
        ),
        childBuilder: (controller) => Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Scaffold(
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(0),
                child: AppBar(
                  systemOverlayStyle: SystemUiOverlayStyle.light,
                  backgroundColor:
                      Theme.of(context).primaryColor.withOpacity(0.6),
                ),
              ),
              body: SafeArea(
                top: true,
                bottom: false,
                child: TabBarView(
                  controller: _controller,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    EssayScreen(slidingController: controller),
                    DiaryScreen(slidingController: controller),
                    const MyinfoScreen(),
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
      ),
    );
  }
}
