import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sliding_up_panel/sliding_up_panel_widget.dart';
import 'package:unknown_note_flutter/bloc/home/home_screen_cubit.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';
import 'package:unknown_note_flutter/enums/enum_home_screen.dart';
import 'package:unknown_note_flutter/pages/home/widgets/home_sliding_panel.dart';
import 'package:unknown_note_flutter/screens/diary/diary_screen.dart';
import 'package:unknown_note_flutter/screens/essay/essay_screen.dart';
import 'package:unknown_note_flutter/screens/myinfo/myinfo_screen.dart';
import 'package:unknown_note_flutter/pages/home/widgets/home_navigaton_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _controller;
  late SlidingUpPanelController _slidingController;
  double dragStartPos = 0;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: 3,
      vsync: this,
    );
    _slidingController = SlidingUpPanelController(
      value: SlidingUpPanelStatus.hidden,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _slidingController.dispose();
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
            body: SafeArea(
              top: true,
              bottom: false,
              child: TabBarView(
                controller: _controller,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  EssayScreen(slidingController: _slidingController),
                  const DiaryScreen(),
                  const MyinfoScreen(),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: Sizes.size20,
              right: Sizes.size20,
              bottom: MediaQuery.of(context).padding.bottom,
            ),
            child: const HomeNavigationBar(),
          ),
          SlidingUpPanelWidget(
            panelController: _slidingController,
            controlHeight: 300,
            panelStatus: SlidingUpPanelStatus.hidden,
            enableOnTap: false,
            child: const HomeSlidingPanel(),
            dragDown: (details) {
              dragStartPos = details.globalPosition.dy;
            },
            dragEnd: (details) {
              if ((details.primaryVelocity ?? 0) > 10 && dragStartPos > 600) {
                _slidingController.hide();
              }
            },
          ),
        ],
      ),
    );
  }
}
