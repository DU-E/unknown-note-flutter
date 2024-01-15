import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_localizations/syncfusion_localizations.dart';
import 'package:unknown_note_flutter/bloc/authentication/auth_bloc_singleton.dart';
import 'package:unknown_note_flutter/bloc/authentication/auth_state.dart';
import 'package:unknown_note_flutter/bloc/calendar/calendar_state_cubit.dart';
import 'package:unknown_note_flutter/bloc/diary/write_diary_bloc.dart';
import 'package:unknown_note_flutter/bloc/essay/write_essay_bloc.dart';
import 'package:unknown_note_flutter/common/transitions/my_transition_page.dart';
import 'package:unknown_note_flutter/models/diary/diary_model.dart';
import 'package:unknown_note_flutter/models/essay/essay_model.dart';
import 'package:unknown_note_flutter/pages/home/home_page.dart';
import 'package:unknown_note_flutter/pages/profile/profile_page.dart';
import 'package:unknown_note_flutter/pages/read_diary/read_diary_page.dart';
import 'package:unknown_note_flutter/pages/read_essay/read_essay_page.dart';
import 'package:unknown_note_flutter/pages/signin/signin_page.dart';
import 'package:unknown_note_flutter/pages/write_diary/write_diary_page.dart';
import 'package:unknown_note_flutter/pages/write_essay/write_essay_page.dart';
import 'package:unknown_note_flutter/repository/authentication_repository.dart';

class AppRoutes extends StatefulWidget {
  const AppRoutes({super.key});

  @override
  State<AppRoutes> createState() => _AppRoutesState();
}

class _AppRoutesState extends State<AppRoutes> {
  late GoRouter _routerConfig;

  @override
  void initState() {
    super.initState();

    // Initialize AuthBloc
    AuthBlocSingleton.initializer(
      repository: context.read<AuthenticationRepository>(),
    );

    // Set routerConfig
    _routerConfig = GoRouter(
      initialLocation: '/home',
      refreshListenable: AuthBlocSingleton.bloc,
      redirect: (context, state) {
        final authState = AuthBlocSingleton.bloc.state;

        if (authState is AuthUnknownState) return '/signin';
        if (authState is AuthUnAuthState) return '/profile';
        if (authState is AuthAuthState) return '/home';

        return state.path;
      },
      routes: [
        GoRoute(
          path: '/signin',
          pageBuilder: (context, state) => transPage(
            key: state.pageKey,
            child: const SigninPage(),
          ),
        ),
        GoRoute(
          path: '/home',
          pageBuilder: (context, state) => transPage(
            key: state.pageKey,
            child: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => CalendarStateCubit(),
                ),
              ],
              child: const HomePage(),
            ),
          ),
        ),
        GoRoute(
          path: '/essay/:id',
          pageBuilder: (context, state) => transPage(
            key: state.pageKey,
            child: ReadEssayPage(
              essay: state.extra as EssayModel,
            ),
          ),
        ),
        GoRoute(
          path: '/write/essay',
          pageBuilder: (context, state) => transPage(
            key: state.pageKey,
            child: BlocProvider(
              create: (context) => WriteEssayBloc(),
              child: const WriteEssayPage(),
            ),
          ),
        ),
        GoRoute(
          path: '/diary/:id',
          pageBuilder: (context, state) => transPage(
            key: state.pageKey,
            child: ReadDiaryPage(
              diary: state.extra as DiaryModel,
            ),
          ),
        ),
        GoRoute(
          path: '/write/diary',
          pageBuilder: (context, state) => transPage(
            key: state.pageKey,
            child: BlocProvider(
              create: (context) => WriteDiaryBloc(),
              child: const WriteDiaryPage(),
            ),
          ),
        ),
        GoRoute(
          path: '/profile',
          pageBuilder: (context, state) => transPage(
            key: state.pageKey,
            child: const ProfilePage(),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _routerConfig,
      title: 'Unknown Note',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        SfGlobalLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ko'),
        Locale('en'),
      ],
      locale: const Locale('ko'),
    );
  }
}
