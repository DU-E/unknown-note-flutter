import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart' as ft;
import 'package:test/test.dart';
import 'package:unknown_note_flutter/bloc/authentication/auth_bloc_singleton.dart';
import 'package:unknown_note_flutter/bloc/authentication/auth_event.dart';
import 'package:unknown_note_flutter/bloc/essay/essay_like_cubit.dart';
import 'package:unknown_note_flutter/constants/strings.dart';
import 'package:unknown_note_flutter/enums/enum_loading_status.dart';
import 'package:unknown_note_flutter/models/user/user_model.dart';
import 'package:unknown_note_flutter/repository/mock/mock_authentication_repository.dart';
import 'package:unknown_note_flutter/repository/mock/mock_dude_essay_repository.dart';
import 'package:unknown_note_flutter/repository/mock/mock_dude_user_repository.dart';

void main() {
  ft.TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() async {
    FlutterSecureStorage.setMockInitialValues({
      Strings.jwtToken: 'jwt_token',
    });

    AuthBlocSingleton.initializer(
      authRepository: MockAuthenticationRepository(delay: 10),
      userRepository: MockDudeUserRepository(delay: 10),
    );
    AuthBlocSingleton.bloc.add(AuthSetUserEvnet(UserModel(nickName: 'tester')));

    await Future.delayed(const Duration(milliseconds: 10));
  });

  const int essayId = 1;

  /// ============================================
  /// POST / DELETE SUCCESS CASE TEST
  /// ============================================
  group(
    '[SUCCESS] [POST / DELETE] $EssayLikeCubit',
    () {
      late EssayLikeCubit essayLikeCubit;

      setUp(() {
        essayLikeCubit = EssayLikeCubit(
          essayId: essayId,
          essayRepository: MockDudeEssayRepository(delay: 10),
        );
      });

      test('Initialize', () {
        expect(essayLikeCubit.state, const EssayLikeState.init());
      });

      blocTest<EssayLikeCubit, EssayLikeState>(
        'Like / Dislike Essay',
        build: () => essayLikeCubit,
        act: (bloc) async {
          bloc.tapLike();
          await Future.delayed(const Duration(milliseconds: 50));
          bloc.tapLike();
        },
        expect: () => [
          isA<EssayLikeState>()
              .having((state) => state.status, 'status', ELoadingStatus.loading)
              .having((state) => state.isLike, 'isLike', true),
          isA<EssayLikeState>()
              .having((state) => state.status, 'status', ELoadingStatus.init)
              .having((state) => state.isLike, 'isLike', true),
          isA<EssayLikeState>()
              .having((state) => state.status, 'status', ELoadingStatus.loading)
              .having((state) => state.isLike, 'isLike', false),
          isA<EssayLikeState>()
              .having((state) => state.status, 'status', ELoadingStatus.init)
              .having((state) => state.isLike, 'isLike', false),
        ],
        wait: const Duration(milliseconds: 100),
      );

      tearDown(() {
        essayLikeCubit.close();
      });
    },
  );

  /// ============================================
  /// AUTH ERROR CASE TEST
  /// ============================================
  group(
    '[ERROR - 2000] $EssayLikeCubit',
    () {
      late EssayLikeCubit essayLikeCubit;

      setUp(() {
        essayLikeCubit = EssayLikeCubit(
          essayId: essayId,
          essayRepository: MockDudeEssayRepository(
            delay: 10,
            errorCode: 2000,
          ),
        );
      });

      test('Initialize', () {
        expect(essayLikeCubit.state, const EssayLikeState.init());
      });

      blocTest<EssayLikeCubit, EssayLikeState>(
        'Like Essay',
        build: () => essayLikeCubit,
        act: (bloc) => bloc.tapLike(),
        expect: () => [
          isA<EssayLikeState>()
              .having((state) => state.status, 'status', ELoadingStatus.loading)
              .having((state) => state.isLike, 'isLike', true),
          isA<EssayLikeState>()
              .having((state) => state.status, 'status', ELoadingStatus.error)
              .having((state) => state.isLike, 'isLike', false)
              .having((state) => state.message, 'message',
                  '[2000] ERROR WITH 2000'),
          isA<EssayLikeState>()
              .having((state) => state.status, 'status', ELoadingStatus.init),
        ],
        wait: const Duration(milliseconds: 50),
      );

      tearDown(() {
        essayLikeCubit.close();
      });
    },
  );

  /// ============================================
  /// OTHER ERROR CASE TEST
  /// ============================================
  group(
    '[ERROR - 4000] $EssayLikeCubit',
    () {
      late EssayLikeCubit essayLikeCubit;

      setUp(() {
        essayLikeCubit = EssayLikeCubit(
          essayId: essayId,
          essayRepository: MockDudeEssayRepository(
            delay: 10,
            errorCode: 4000,
          ),
        );
      });

      test('Initialize', () {
        expect(essayLikeCubit.state, const EssayLikeState.init());
      });

      blocTest<EssayLikeCubit, EssayLikeState>(
        'Like Diary',
        build: () => essayLikeCubit,
        act: (bloc) => bloc.tapLike(),
        expect: () => [
          isA<EssayLikeState>()
              .having((state) => state.status, 'status', ELoadingStatus.loading)
              .having((state) => state.isLike, 'isLike', true),
          isA<EssayLikeState>()
              .having((state) => state.status, 'status', ELoadingStatus.error)
              .having((state) => state.isLike, 'isLike', false)
              .having((state) => state.message, 'message',
                  '[4000] ERROR WITH 4000'),
          isA<EssayLikeState>()
              .having((state) => state.status, 'status', ELoadingStatus.init)
              .having((state) => state.isLike, 'isLike', false),
        ],
        wait: const Duration(milliseconds: 50),
      );

      tearDown(() {
        essayLikeCubit.close();
      });
    },
  );
}
