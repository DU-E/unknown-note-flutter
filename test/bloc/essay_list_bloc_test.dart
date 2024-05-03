import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart' as ft;
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:unknown_note_flutter/bloc/authentication/auth_bloc_singleton.dart';
import 'package:unknown_note_flutter/bloc/authentication/auth_event.dart';
import 'package:unknown_note_flutter/bloc/essay/essay_list_bloc.dart';
import 'package:unknown_note_flutter/bloc/essay/essay_list_event.dart';
import 'package:unknown_note_flutter/bloc/essay/essay_list_state.dart';
import 'package:unknown_note_flutter/constants/strings.dart';
import 'package:unknown_note_flutter/enums/enum_essay_category.dart';
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

  /// ============================================
  /// GET SUCCESS CASE TEST
  /// ============================================
  group(
    '[SUCCESS] [GET] $EssayListBloc',
    () {
      late EssayListBloc essayListBloc;

      setUp(() {
        essayListBloc = EssayListBloc(
          dudeEssayRepository: MockDudeEssayRepository(delay: 10),
        );
      });

      test('Initialize', () {
        expect(essayListBloc.state, const EssayListState.init());
      });

      blocTest<EssayListBloc, EssayListState>(
        'Get Essay List',
        build: () => essayListBloc,
        act: (bloc) async {
          bloc.add(EssayListLoadMore());
          await Future.delayed(const Duration(milliseconds: 50));
          bloc.add(EssayListRetry());
          await Future.delayed(const Duration(milliseconds: 50));
          bloc.add(EssayListLoadMore());
          await Future.delayed(const Duration(milliseconds: 50));
          bloc.add(EssayListChangeCategory(category: EEssayCategory.subs));
        },
        expect: () => [
          isA<EssayListState>()
              .having((state) => state.status, 'status', ELoadingStatus.loading)
              .having((state) => state.list.length, 'essay length', 0)
              .having((state) => state.page, 'page', 0),
          isA<EssayListState>()
              .having((state) => state.status, 'status', ELoadingStatus.loaded)
              .having((state) => state.list.length, 'essay length', 20)
              .having((state) => state.page, 'page', 1),
          isA<EssayListState>()
              .having((state) => state.status, 'status', ELoadingStatus.init)
              .having((state) => state.list.length, 'essay length', 20)
              .having((state) => state.page, 'page', 1),
          isA<EssayListState>()
              .having((state) => state.status, 'status', ELoadingStatus.loading)
              .having((state) => state.list.length, 'essay length', 20)
              .having((state) => state.page, 'page', 1),
          isA<EssayListState>()
              .having((state) => state.status, 'status', ELoadingStatus.loaded)
              .having((state) => state.list.length, 'essay length', 40)
              .having((state) => state.page, 'page', 2),
          isA<EssayListState>()
              .having((state) => state.status, 'status', ELoadingStatus.init)
              .having((state) => state.list.length, 'essay length', 0)
              .having((state) => state.page, 'page', 0)
              .having(
                  (state) => state.category, 'category', EEssayCategory.subs),
        ],
        wait: const Duration(milliseconds: 200),
      );

      tearDown(() {
        essayListBloc.close();
      });
    },
  );

  /// ============================================
  /// AUTH ERROR CASE TEST
  /// ============================================
  group(
    '[ERROR - 2000] $EssayListBloc',
    () {
      late EssayListBloc essayListBloc;

      setUp(() {
        essayListBloc = EssayListBloc(
          dudeEssayRepository: MockDudeEssayRepository(
            delay: 10,
            errorCode: 2000,
          ),
        );
      });

      test('Initialize', () {
        expect(essayListBloc.state, const EssayListState.init());
      });

      blocTest<EssayListBloc, EssayListState>(
        'Get Essay List',
        build: () => essayListBloc,
        act: (bloc) => bloc.add(EssayListLoadMore()),
        expect: () => [
          isA<EssayListState>()
              .having((state) => state.status, 'status', ELoadingStatus.loading)
              .having((state) => state.list.length, 'essay length', 0)
              .having((state) => state.page, 'page', 0),
          isA<EssayListState>()
              .having((state) => state.status, 'status', ELoadingStatus.error)
              .having((state) => state.message, 'message',
                  '[2000] ERROR WITH 2000'),
        ],
        wait: const Duration(milliseconds: 50),
      );

      tearDown(() {
        essayListBloc.close();
      });
    },
  );

  /// ============================================
  /// OTHER ERROR CASE TEST
  /// ============================================
  group(
    '[ERROR - 4000] $EssayListBloc',
    () {
      late EssayListBloc essayListBloc;

      setUp(() {
        essayListBloc = EssayListBloc(
          dudeEssayRepository: MockDudeEssayRepository(
            delay: 10,
            errorCode: 4000,
          ),
        );
      });

      test('Initialize', () {
        expect(essayListBloc.state, const EssayListState.init());
      });

      blocTest<EssayListBloc, EssayListState>(
        'Get Essay List',
        build: () => essayListBloc,
        act: (bloc) => bloc.add(EssayListLoadMore()),
        expect: () => [
          isA<EssayListState>()
              .having((state) => state.status, 'status', ELoadingStatus.loading)
              .having((state) => state.list.length, 'essay length', 0)
              .having((state) => state.page, 'page', 0),
          isA<EssayListState>()
              .having((state) => state.status, 'status', ELoadingStatus.error)
              .having((state) => state.list.length, 'essay length', 0)
              .having((state) => state.page, 'page', 0)
              .having((state) => state.message, 'message',
                  '[4000] ERROR WITH 4000'),
        ],
        wait: const Duration(milliseconds: 50),
      );

      tearDown(() {
        essayListBloc.close();
      });
    },
  );
}
