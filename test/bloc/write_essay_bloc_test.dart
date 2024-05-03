import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart' as ft;
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:unknown_note_flutter/bloc/authentication/auth_bloc_singleton.dart';
import 'package:unknown_note_flutter/bloc/authentication/auth_event.dart';
import 'package:unknown_note_flutter/bloc/essay/write_essay_bloc.dart';
import 'package:unknown_note_flutter/bloc/essay/write_essay_event.dart';
import 'package:unknown_note_flutter/bloc/essay/write_essay_state.dart';
import 'package:unknown_note_flutter/constants/strings.dart';
import 'package:unknown_note_flutter/enums/enum_essay_category.dart';
import 'package:unknown_note_flutter/enums/enum_http_method.dart';
import 'package:unknown_note_flutter/enums/enum_loading_status.dart';
import 'package:unknown_note_flutter/models/essay/essay_model.dart';
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
  /// POST SUCCESS CASE TEST
  /// ============================================
  group(
    '[SUCCESS] [POST] $WriteEssayBloc',
    () {
      late WriteEssayBloc writeEssayBloc;

      setUp(() {
        writeEssayBloc = WriteEssayBloc(
          essayRepository: MockDudeEssayRepository(delay: 10),
          httpMethod: EHttpMethod.post,
        );
      });

      test('Initialize', () {
        expect(writeEssayBloc.state, const WriteEssayState.init());
      });

      blocTest<WriteEssayBloc, WriteEssayState>(
        'Write Essay',
        build: () => writeEssayBloc,
        act: (bloc) => bloc.add(WriteEssayUpload(
          EssayModel(
            id: 1,
            category: EEssayCategory.poem,
            content: 'test content',
            likes: 10,
            time: DateTime.now(),
            title: 'test title',
          ),
        )),
        expect: () => [
          isA<WriteEssayState>().having(
              (state) => state.status, 'status', ELoadingStatus.loading),
          isA<WriteEssayState>()
              .having((state) => state.status, 'status', ELoadingStatus.loaded),
        ],
        wait: const Duration(milliseconds: 50),
      );

      tearDown(() {
        writeEssayBloc.close();
      });
    },
  );

  /// ============================================
  /// PATCH SUCCESS CASE TEST
  /// ============================================
  group(
    '[SUCCESS] [PATCH] $WriteEssayBloc',
    () {
      late WriteEssayBloc writeEssayBloc;

      setUp(() {
        writeEssayBloc = WriteEssayBloc(
          essayRepository: MockDudeEssayRepository(delay: 10),
          httpMethod: EHttpMethod.patch,
        );
      });

      test('Initialize', () {
        expect(writeEssayBloc.state, const WriteEssayState.init());
      });

      blocTest<WriteEssayBloc, WriteEssayState>(
        'Write Essay',
        build: () => writeEssayBloc,
        act: (bloc) => bloc.add(WriteEssayUpload(
          EssayModel(
            id: 1,
            category: EEssayCategory.poem,
            content: 'test content',
            likes: 10,
            time: DateTime.now(),
            title: 'test title',
          ),
        )),
        expect: () => [
          isA<WriteEssayState>().having(
              (state) => state.status, 'status', ELoadingStatus.loading),
          isA<WriteEssayState>()
              .having((state) => state.status, 'status', ELoadingStatus.loaded),
        ],
        wait: const Duration(milliseconds: 50),
      );

      tearDown(() {
        writeEssayBloc.close();
      });
    },
  );

  /// ============================================
  /// VALIDATION ERROR CASE TEST
  /// ============================================
  group(
    '[ERROR] [VALIDATION] $WriteEssayBloc',
    () {
      late WriteEssayBloc writeEssayBloc;

      setUp(() {
        writeEssayBloc = WriteEssayBloc(
          essayRepository: MockDudeEssayRepository(delay: 10),
          httpMethod: EHttpMethod.post,
        );
      });

      test('Initialize', () {
        expect(writeEssayBloc.state, const WriteEssayState.init());
      });

      blocTest<WriteEssayBloc, WriteEssayState>(
        'Write Essay',
        build: () => writeEssayBloc,
        act: (bloc) async {
          bloc.add(WriteEssayUpload(
            EssayModel(
              id: 1,
              // category: EEssayCategory.poem,
              content: 'test content',
              likes: 10,
              time: DateTime.now(),
              title: 'test title',
            ),
          ));
          await Future.delayed(const Duration(milliseconds: 100));
          bloc.add(WriteEssayUpload(
            EssayModel(
              id: 1,
              category: EEssayCategory.poem,
              content: 'test content',
              likes: 10,
              time: DateTime.now(),
              // title: 'test title',
            ),
          ));
          await Future.delayed(const Duration(milliseconds: 100));
          bloc.add(WriteEssayUpload(
            EssayModel(
              id: 1,
              category: EEssayCategory.poem,
              // content: 'test content',
              likes: 10,
              time: DateTime.now(),
              title: 'test title',
            ),
          ));
        },
        expect: () => [
          isA<WriteEssayState>()
              .having((state) => state.status, 'status', ELoadingStatus.error)
              .having((state) => state.message, 'message', '카테고리를 선택해주세요.'),
          isA<WriteEssayState>()
              .having((state) => state.status, 'status', ELoadingStatus.init),
          isA<WriteEssayState>()
              .having((state) => state.status, 'status', ELoadingStatus.error)
              .having((state) => state.message, 'message', '제목을 작성해주세요.'),
          isA<WriteEssayState>()
              .having((state) => state.status, 'status', ELoadingStatus.init),
          isA<WriteEssayState>()
              .having((state) => state.status, 'status', ELoadingStatus.error)
              .having((state) => state.message, 'message', '내용을 작성해주세요.'),
          isA<WriteEssayState>()
              .having((state) => state.status, 'status', ELoadingStatus.init),
        ],
        wait: const Duration(milliseconds: 150),
      );

      tearDown(() {
        writeEssayBloc.close();
      });
    },
  );

  /// ============================================
  /// AUTH ERROR CASE TEST
  /// ============================================
  group(
    '[ERROR - 2000] $WriteEssayBloc',
    () {
      late WriteEssayBloc writeEssayBloc;

      setUp(() {
        writeEssayBloc = WriteEssayBloc(
          essayRepository: MockDudeEssayRepository(
            delay: 10,
            errorCode: 2000,
          ),
          httpMethod: EHttpMethod.post,
        );
      });

      test('Initialize', () {
        expect(writeEssayBloc.state, const WriteEssayState.init());
      });

      blocTest<WriteEssayBloc, WriteEssayState>(
        'Write Essay',
        build: () => writeEssayBloc,
        act: (bloc) => bloc.add(WriteEssayUpload(
          EssayModel(
            id: 1,
            category: EEssayCategory.poem,
            content: 'test content',
            likes: 10,
            time: DateTime.now(),
            title: 'test title',
          ),
        )),
        expect: () => [
          isA<WriteEssayState>().having(
              (state) => state.status, 'status', ELoadingStatus.loading),
          isA<WriteEssayState>()
              .having((state) => state.status, 'status', ELoadingStatus.error)
              .having((state) => state.message, 'message',
                  '[2000] ERROR WITH 2000'),
          isA<WriteEssayState>()
              .having((state) => state.status, 'status', ELoadingStatus.init),
        ],
        wait: const Duration(milliseconds: 50),
      );

      tearDown(() {
        writeEssayBloc.close();
      });
    },
  );

  /// ============================================
  /// OTHER ERROR CASE TEST
  /// ============================================
  group(
    '[ERROR - 4000] $WriteEssayBloc',
    () {
      late WriteEssayBloc writeEssayBloc;

      setUp(() {
        writeEssayBloc = WriteEssayBloc(
          essayRepository: MockDudeEssayRepository(
            delay: 10,
            errorCode: 4000,
          ),
          httpMethod: EHttpMethod.post,
        );
      });

      test('Initialize', () {
        expect(writeEssayBloc.state, const WriteEssayState.init());
      });

      blocTest<WriteEssayBloc, WriteEssayState>(
        'Write Essay',
        build: () => writeEssayBloc,
        act: (bloc) => bloc.add(WriteEssayUpload(
          EssayModel(
            id: 1,
            category: EEssayCategory.poem,
            content: 'test content',
            likes: 10,
            time: DateTime.now(),
            title: 'test title',
          ),
        )),
        expect: () => [
          isA<WriteEssayState>().having(
              (state) => state.status, 'status', ELoadingStatus.loading),
          isA<WriteEssayState>()
              .having((state) => state.status, 'status', ELoadingStatus.error)
              .having((state) => state.message, 'message',
                  '[4000] ERROR WITH 4000'),
          isA<WriteEssayState>()
              .having((state) => state.status, 'status', ELoadingStatus.init),
        ],
        wait: const Duration(milliseconds: 50),
      );

      tearDown(() {
        writeEssayBloc.close();
      });
    },
  );
}
