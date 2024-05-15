import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_localizations/syncfusion_localizations.dart';
import 'package:unknown_note_flutter/bloc/authentication/auth_bloc_singleton.dart';
import 'package:unknown_note_flutter/bloc/authentication/auth_state.dart';
import 'package:unknown_note_flutter/bloc/calendar/calendar_bloc.dart';
import 'package:unknown_note_flutter/bloc/calendar/calendar_state_cubit.dart';
import 'package:unknown_note_flutter/bloc/diary/diary_bloc.dart';
import 'package:unknown_note_flutter/bloc/diary/write_diary_bloc.dart';
import 'package:unknown_note_flutter/bloc/essay/essay_like_cubit.dart';
import 'package:unknown_note_flutter/bloc/essay/essay_list_bloc.dart';
import 'package:unknown_note_flutter/bloc/essay/write_essay_bloc.dart';
import 'package:unknown_note_flutter/bloc/home/home_screen_cubit.dart';
import 'package:unknown_note_flutter/bloc/splash/splash_cubit.dart';
import 'package:unknown_note_flutter/bloc/user_edit/user_edit_bloc.dart';
import 'package:unknown_note_flutter/bloc/user_info/user_essay_bloc.dart';
import 'package:unknown_note_flutter/bloc/user_info/user_info_bloc.dart';
import 'package:unknown_note_flutter/enums/enum_http_method.dart';
import 'package:unknown_note_flutter/models/user/user_model.dart';
import 'package:unknown_note_flutter/pages/splash/splash_page.dart';
import 'package:unknown_note_flutter/pages/user_edit/user_edit_page.dart';
import 'package:unknown_note_flutter/pages/user_info/user_info_page.dart';
import 'package:unknown_note_flutter/repository/interface/interface_authentication_repository.dart';
import 'package:unknown_note_flutter/repository/interface/interface_dude_diary_repository.dart';
import 'package:unknown_note_flutter/repository/interface/interface_dude_essay_repository.dart';
import 'package:unknown_note_flutter/repository/interface/interfece_dude_image_repository.dart';
import 'package:unknown_note_flutter/repository/interface/interfece_dude_user_repository.dart';
import 'package:unknown_note_flutter/utils/my_transition_page.dart';
import 'package:unknown_note_flutter/models/diary/diary_model.dart';
import 'package:unknown_note_flutter/models/essay/essay_model.dart';
import 'package:unknown_note_flutter/pages/home/home_page.dart';
import 'package:unknown_note_flutter/pages/read_diary/read_diary_page.dart';
import 'package:unknown_note_flutter/pages/read_essay/read_essay_page.dart';
import 'package:unknown_note_flutter/pages/signin/signin_page.dart';
import 'package:unknown_note_flutter/pages/write_diary/write_diary_page.dart';
import 'package:unknown_note_flutter/pages/write_essay/write_essay_page.dart';

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
      authRepository: context.read<IAuthenticationRepository>(),
      userRepository: context.read<IDudeUserRepository>(),
    );

    // Set routerConfig
    _routerConfig = GoRouter(
      initialLocation: '/',
      refreshListenable: AuthBlocSingleton.bloc,
      redirect: (context, state) {
        final authState = AuthBlocSingleton.bloc.state;
        final blockPageInAuthAuthState = ['/', '/signin'];

        if (authState is AuthInitState) return '/';
        if (authState is AuthUnknownState || authState is AuthErrorState) {
          return '/signin';
        }
        if (authState is AuthUnAuthState) return '/edit/profile';
        if (authState is AuthAuthState) {
          return blockPageInAuthAuthState.contains(state.matchedLocation)
              ? '/home'
              : state.matchedLocation;
        }

        return state.matchedLocation;
      },
      routes: [
        GoRoute(
          path: '/',
          pageBuilder: (context, state) => transPage(
            key: state.pageKey,
            child: BlocProvider(
              create: (context) => SplashCubit(),
              child: const SplashPage(),
            ),
          ),
        ),
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
                  create: (context) => HomeScreenCubit(),
                ),
                BlocProvider(
                  create: (context) => CalendarStateCubit(),
                ),
                BlocProvider(
                  create: (context) => CalendarBloc(
                    dudeDiaryRepository: context.read<IDudeDiaryRepository>(),
                  ),
                ),
                BlocProvider(
                  create: (context) => EssayListBloc(
                    dudeEssayRepository: context.read<IDudeEssayRepository>(),
                  ),
                ),
                BlocProvider(
                  create: (context) => DiaryBloc(
                    dudeDiaryRepository: context.read<IDudeDiaryRepository>(),
                  ),
                ),
                BlocProvider(
                  create: (context) => UserInfoBloc(
                    userRepository: context.read<IDudeUserRepository>(),
                  ),
                ),
                BlocProvider(
                  create: (context) => UserEssayBloc(
                    userId: (AuthBlocSingleton.bloc.state as AuthAuthState)
                        .user
                        .userId!,
                    dudeEssayRepository: context.read<IDudeEssayRepository>(),
                  ),
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
            child: BlocProvider(
              create: (context) => EssayLikeCubit(
                essayRepository: context.read<IDudeEssayRepository>(),
                essayId: (state.extra as EssayModel).id ?? -1,
              ),
              child: ReadEssayPage(
                essay: state.extra as EssayModel,
              ),
            ),
          ),
        ),
        GoRoute(
          path: '/write/essay',
          pageBuilder: (context, state) => transPage(
            key: state.pageKey,
            child: BlocProvider(
              create: (context) => WriteEssayBloc(
                essayRepository: context.read<IDudeEssayRepository>(),
                httpMethod:
                    state.extra == null ? EHttpMethod.post : EHttpMethod.patch,
              ),
              child: WriteEssayPage(
                essay: state.extra as EssayModel?,
              ),
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
              create: (context) => WriteDiaryBloc(
                diaryRepository: context.read<IDudeDiaryRepository>(),
                httpMethod:
                    state.extra == null ? EHttpMethod.post : EHttpMethod.patch,
              ),
              child: WriteDiaryPage(
                diary: state.extra as DiaryModel?,
              ),
            ),
          ),
        ),
        GoRoute(
          path: '/profile/:userId',
          pageBuilder: (context, state) => transPage(
            key: state.pageKey,
            child: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => UserInfoBloc(
                    userId: int.parse(state.pathParameters['userId']!),
                    userRepository: context.read<IDudeUserRepository>(),
                  ),
                ),
                BlocProvider(
                  create: (context) => UserEssayBloc(
                    userId: int.parse(state.pathParameters['userId']!),
                    dudeEssayRepository: context.read<IDudeEssayRepository>(),
                  ),
                ),
              ],
              child: UserInfoPage(
                popAble: true,
                userId: int.parse(state.pathParameters['userId']!),
                nickName: state.extra != null ? state.extra as String : null,
              ),
            ),
          ),
        ),
        GoRoute(
          path: '/edit/profile',
          pageBuilder: (context, state) => transPage(
            child: BlocProvider(
              create: (context) {
                UserModel? user;
                if (AuthBlocSingleton.bloc.state is AuthUnAuthState) {
                  user = (AuthBlocSingleton.bloc.state as AuthUnAuthState).user;
                } else if (AuthBlocSingleton.bloc.state is AuthAuthState) {
                  user = (AuthBlocSingleton.bloc.state as AuthAuthState).user;
                }
                return UserEditBloc(
                  dudeUserRepository: context.read<IDudeUserRepository>(),
                  dudeImageRepository: context.read<IDudeImageRepository>(),
                  user: user,
                );
              },
              child: UserEditPage(
                popAble: state.extra != null ? state.extra as bool : false,
              ),
            ),
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
