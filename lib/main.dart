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
import 'package:unknown_note_flutter/repository/dude_user_repository.dart';

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
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthenticationRepository(),
        ),
        RepositoryProvider(
          create: (context) => DudeUserRepository(),
        ),
        RepositoryProvider(
          create: (context) => DudeDiaryRepository(),
        ),
        RepositoryProvider(
          create: (context) => DudeEssayRepository(),
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
