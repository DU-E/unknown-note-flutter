import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unknown_note_flutter/bloc/authentication/auth_bloc_singleton.dart';
import 'package:unknown_note_flutter/bloc/authentication/auth_state.dart';
import 'package:unknown_note_flutter/bloc/home/home_screen_cubit.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';
import 'package:unknown_note_flutter/enums/enum_home_screen.dart';
import 'package:unknown_note_flutter/pages/calendar/calendar_page.dart';
import 'package:unknown_note_flutter/pages/diary/diary_page.dart';
import 'package:unknown_note_flutter/pages/essay/essay_page.dart';
import 'package:unknown_note_flutter/pages/user_info/user_info_page.dart';
import 'package:unknown_note_flutter/pages/home/widgets/home_navigaton_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenCubit, EHomeScreen>(
      builder: (context, state) => Stack(
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
              child: IndexedStack(
                index: state.idx,
                children: [
                  const CalendarPage(),
                  const DiaryPage(),
                  const EssayPage(),
                  UserInfoPage(
                    userId: (AuthBlocSingleton.bloc.state as AuthAuthState)
                        .user
                        .userId!,
                  ),
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
