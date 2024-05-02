import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart' as ft;
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:unknown_note_flutter/bloc/diary/diary_bloc.dart';
import 'package:unknown_note_flutter/bloc/diary/diary_event.dart';
import 'package:unknown_note_flutter/bloc/diary/diary_state.dart';
import 'package:unknown_note_flutter/constants/strings.dart';
import 'package:unknown_note_flutter/enums/enum_emotion.dart';
import 'package:unknown_note_flutter/enums/enum_loading_status.dart';
import 'package:unknown_note_flutter/repository/mock/mock_dude_diary_repository.dart';

void main() {
  ft.TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() {
    FlutterSecureStorage.setMockInitialValues({
      Strings.jwtToken: 'jwt_token',
    });
  });

  /// ============================================
  /// GET SUCCESS CASE TEST
  /// ============================================
  group(
    '[SUCCESS] [GET] $DiaryBloc',
    () {
      late DiaryBloc diaryBloc;

      setUp(() {
        diaryBloc = DiaryBloc(
          dudeDiaryRepository: MockDudeDiaryRepository(delay: 10),
        );
      });

      test('Initialize', () {
        expect(diaryBloc.state, const DiaryState.init());
      });

      blocTest<DiaryBloc, DiaryState>(
        'Get Many Happy Diary',
        build: () => diaryBloc,
        act: (bloc) async {
          bloc.add(DiaryGet());
          await Future.delayed(const Duration(milliseconds: 100));
          bloc.add(DiaryGet());
        },
        expect: () => [
          isA<DiaryState>().having(
              (state) => state.status, 'status', ELoadingStatus.loading),
          isA<DiaryState>()
              .having((state) => state.status, 'status', ELoadingStatus.loaded)
              .having((state) => state.emotion, 'emotion', EEmotion.happy)
              .having((state) => state.page, 'page', 1),
          isA<DiaryState>().having(
              (state) => state.status, 'status', ELoadingStatus.loading),
          isA<DiaryState>()
              .having((state) => state.status, 'status', ELoadingStatus.loaded)
              .having((state) => state.emotion, 'emotion', EEmotion.happy)
              .having((state) => state.page, 'page', 2),
        ],
        wait: const Duration(milliseconds: 200),
      );

      blocTest<DiaryBloc, DiaryState>(
        'Change Emotion to Sad',
        build: () => diaryBloc,
        act: (bloc) => bloc.add(DiaryChangeEmotion(emotion: EEmotion.sad)),
        expect: () => [
          isA<DiaryState>().having(
              (state) => state.status, 'status', ELoadingStatus.loading),
          isA<DiaryState>()
              .having((state) => state.status, 'status', ELoadingStatus.loaded)
              .having((state) => state.emotion, 'emotion', EEmotion.sad)
              .having((state) => state.page, 'page', 1),
        ],
        wait: const Duration(milliseconds: 100),
      );

      tearDown(() {
        diaryBloc.close();
      });
    },
  );

  /// ============================================
  /// AUTH ERROR CASE TEST
  /// ============================================
  group(
    '[ERROR - 2000] $DiaryBloc',
    () {
      late DiaryBloc diaryBloc;

      setUp(() {
        diaryBloc = DiaryBloc(
          dudeDiaryRepository: MockDudeDiaryRepository(
            delay: 10,
            errorCode: 2000,
          ),
        );
      });

      test('Initialize', () {
        expect(diaryBloc.state, const DiaryState.init());
      });

      blocTest<DiaryBloc, DiaryState>(
        'Get Happy Diary',
        build: () => diaryBloc,
        act: (bloc) => bloc.add(DiaryGet()),
        expect: () => [
          isA<DiaryState>().having(
              (state) => state.status, 'status', ELoadingStatus.loading),
          isA<DiaryState>()
              .having((state) => state.status, 'status', ELoadingStatus.error)
              .having((state) => state.message, 'message',
                  '[2000] ERROR WITH 2000'),
        ],
        wait: const Duration(milliseconds: 100),
      );

      tearDown(() {
        diaryBloc.close();
      });
    },
  );

  /// ============================================
  /// OTHER ERROR CASE TEST
  /// ============================================
  group(
    '[ERROR - 4000] $DiaryBloc',
    () {
      late DiaryBloc diaryBloc;

      setUp(() {
        diaryBloc = DiaryBloc(
          dudeDiaryRepository: MockDudeDiaryRepository(
            delay: 10,
            errorCode: 4000,
          ),
        );
      });

      test('Initialize', () {
        expect(diaryBloc.state, const DiaryState.init());
      });

      blocTest<DiaryBloc, DiaryState>(
        'Get Happy Diary',
        build: () => diaryBloc,
        act: (bloc) => bloc.add(DiaryGet()),
        expect: () => [
          isA<DiaryState>().having(
              (state) => state.status, 'status', ELoadingStatus.loading),
          isA<DiaryState>()
              .having((state) => state.status, 'status', ELoadingStatus.error)
              .having((state) => state.message, 'message',
                  '[4000] ERROR WITH 4000'),
        ],
        wait: const Duration(milliseconds: 100),
      );

      tearDown(() {
        diaryBloc.close();
      });
    },
  );
}
