import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:path_provider/path_provider.dart';
import 'package:unknown_note_flutter/bloc/setting/setting_bloc.dart';
import 'package:unknown_note_flutter/constants/secret.dart';
import 'package:unknown_note_flutter/firebase_options.dart';
import 'package:unknown_note_flutter/pages/app_routes.dart';
import 'package:unknown_note_flutter/repository/authentication_repository.dart';
import 'package:unknown_note_flutter/repository/dude_diary_repository.dart';
import 'package:unknown_note_flutter/repository/dude_essay_repository.dart';
import 'package:unknown_note_flutter/repository/dude_image_repository.dart';
import 'package:unknown_note_flutter/repository/dude_user_repository.dart';
import 'package:unknown_note_flutter/repository/mock/mock_authentication_repository.dart';
import 'package:unknown_note_flutter/repository/mock/mock_dude_diary_repository.dart';
import 'package:unknown_note_flutter/repository/mock/mock_dude_essay_repository.dart';
import 'package:unknown_note_flutter/repository/mock/mock_dude_image_repository.dart';
import 'package:unknown_note_flutter/repository/mock/mock_dude_user_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  KakaoSdk.init(nativeAppKey: Secret.kakaoAppKey);

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const bool _isDev = true;

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => _isDev
              ? MockAuthenticationRepository()
              : AuthenticationRepository(),
        ),
        RepositoryProvider(
          create: (context) =>
              _isDev ? MockDudeUserRepository() : DudeUserRepository(),
        ),
        RepositoryProvider(
          create: (context) =>
              _isDev ? MockDudeDiaryRepository() : DudeDiaryRepository(),
        ),
        RepositoryProvider(
          create: (context) =>
              _isDev ? MockDudeEssayRepository() : DudeEssayRepository(),
        ),
        RepositoryProvider(
          create: (context) =>
              _isDev ? MockDudeImageRepository() : DudeImageRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SettingBloc(),
          ),
        ],
        child: const AppRoutes(),
      ),
    );
  }
}
