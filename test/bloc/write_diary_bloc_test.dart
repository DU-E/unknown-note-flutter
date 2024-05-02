import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart' as ft;
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:unknown_note_flutter/bloc/diary/write_diary_bloc.dart';
import 'package:unknown_note_flutter/bloc/diary/write_diary_event.dart';
import 'package:unknown_note_flutter/bloc/diary/write_diary_state.dart';
import 'package:unknown_note_flutter/constants/strings.dart';
import 'package:unknown_note_flutter/enums/enum_emotion.dart';
import 'package:unknown_note_flutter/enums/enum_http_method.dart';
import 'package:unknown_note_flutter/enums/enum_loading_status.dart';
import 'package:unknown_note_flutter/models/diary/diary_model.dart';
import 'package:unknown_note_flutter/repository/mock/mock_dude_diary_repository.dart';

void main() {
  ft.TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() {
    FlutterSecureStorage.setMockInitialValues({
      Strings.jwtToken: 'jwt_token',
    });
  });

  /// ============================================
  /// POST SUCCESS CASE TEST
  /// ============================================
  group(
    '[SUCCESS] [POST] $WriteDiaryBloc',
    () {
      late WriteDiaryBloc writeDiaryBloc;

      setUp(() {
        writeDiaryBloc = WriteDiaryBloc(
          diaryRepository: MockDudeDiaryRepository(delay: 10),
          httpMethod: EHttpMethod.post,
        );
      });

      test('Initialize', () {
        expect(writeDiaryBloc.state, const WriteDiaryState.init());
      });

      blocTest<WriteDiaryBloc, WriteDiaryState>(
        'Write Diary',
        build: () => writeDiaryBloc,
        act: (bloc) => bloc.add(WriteDiaryUpload(
          DiaryModel(
            id: 1,
            content: 'test content',
            emotion: EEmotion.happy,
            isOpen: false,
            time: DateTime.now(),
            userId: 1,
          ),
        )),
        expect: () => [
          isA<WriteDiaryState>().having(
              (state) => state.status, 'status', ELoadingStatus.loading),
          isA<WriteDiaryState>()
              .having((state) => state.status, 'status', ELoadingStatus.loaded),
        ],
        wait: const Duration(milliseconds: 100),
      );

      tearDown(() {
        writeDiaryBloc.close();
      });
    },
  );

  /// ============================================
  /// PATCH SUCCESS CASE TEST
  /// ============================================
  group(
    '[SUCCESS] [PATCH] $WriteDiaryBloc',
    () {
      late WriteDiaryBloc writeDiaryBloc;

      setUp(() {
        writeDiaryBloc = WriteDiaryBloc(
          diaryRepository: MockDudeDiaryRepository(delay: 10),
          httpMethod: EHttpMethod.patch,
        );
      });

      test('Initialize', () {
        expect(writeDiaryBloc.state, const WriteDiaryState.init());
      });

      blocTest<WriteDiaryBloc, WriteDiaryState>(
        'Write Diary',
        build: () => writeDiaryBloc,
        act: (bloc) => bloc.add(WriteDiaryUpload(
          DiaryModel(
            id: 1,
            content: 'test content',
            emotion: EEmotion.happy,
            isOpen: false,
            time: DateTime.now(),
            userId: 1,
          ),
        )),
        expect: () => [
          isA<WriteDiaryState>().having(
              (state) => state.status, 'status', ELoadingStatus.loading),
          isA<WriteDiaryState>()
              .having((state) => state.status, 'status', ELoadingStatus.loaded),
        ],
        wait: const Duration(milliseconds: 100),
      );

      tearDown(() {
        writeDiaryBloc.close();
      });
    },
  );

  /// ============================================
  /// VALIDATION ERROR CASE TEST
  /// ============================================
  group(
    '[ERROR] [VALIDATION] $WriteDiaryBloc',
    () {
      late WriteDiaryBloc writeDiaryBloc;

      setUp(() {
        writeDiaryBloc = WriteDiaryBloc(
          diaryRepository: MockDudeDiaryRepository(delay: 10),
          httpMethod: EHttpMethod.post,
        );
      });

      test('Initialize', () {
        expect(writeDiaryBloc.state, const WriteDiaryState.init());
      });

      blocTest<WriteDiaryBloc, WriteDiaryState>(
        'Write Diary',
        build: () => writeDiaryBloc,
        act: (bloc) async {
          bloc.add(WriteDiaryUpload(
            DiaryModel(
              id: 1,
              content: 'test content',
              isOpen: false,
              time: DateTime.now(),
              userId: 1,
            ),
          ));
          await Future.delayed(const Duration(milliseconds: 100));
          bloc.add(WriteDiaryUpload(
            DiaryModel(
              id: 1,
              emotion: EEmotion.happy,
              isOpen: false,
              time: DateTime.now(),
              userId: 1,
            ),
          ));
        },
        expect: () => [
          isA<WriteDiaryState>()
              .having((state) => state.status, 'status', ELoadingStatus.error)
              .having((state) => state.message, 'message', '감정을 선택해주세요.'),
          isA<WriteDiaryState>()
              .having((state) => state.status, 'status', ELoadingStatus.init),
          isA<WriteDiaryState>()
              .having((state) => state.status, 'status', ELoadingStatus.error)
              .having((state) => state.message, 'message', '내용을 작성해주세요.'),
          isA<WriteDiaryState>()
              .having((state) => state.status, 'status', ELoadingStatus.init),
        ],
        wait: const Duration(milliseconds: 300),
      );

      tearDown(() {
        writeDiaryBloc.close();
      });
    },
  );

  /// ============================================
  /// AUTH ERROR CASE TEST
  /// ============================================
  group(
    '[ERROR - 2000] $WriteDiaryBloc',
    () {
      late WriteDiaryBloc writeDiaryBloc;

      setUp(() {
        writeDiaryBloc = WriteDiaryBloc(
          diaryRepository: MockDudeDiaryRepository(
            delay: 10,
            errorCode: 2000,
          ),
          httpMethod: EHttpMethod.post,
        );
      });

      test('Initialize', () {
        expect(writeDiaryBloc.state, const WriteDiaryState.init());
      });

      blocTest<WriteDiaryBloc, WriteDiaryState>(
        'Write Diary',
        build: () => writeDiaryBloc,
        act: (bloc) => bloc.add(WriteDiaryUpload(
          DiaryModel(
            id: 1,
            content: 'test content',
            emotion: EEmotion.happy,
            isOpen: false,
            time: DateTime.now(),
            userId: 1,
          ),
        )),
        expect: () => [
          isA<WriteDiaryState>().having(
              (state) => state.status, 'status', ELoadingStatus.loading),
          isA<WriteDiaryState>()
              .having((state) => state.status, 'status', ELoadingStatus.error)
              .having((state) => state.message, 'message',
                  '[2000] ERROR WITH 2000'),
          isA<WriteDiaryState>()
              .having((state) => state.status, 'status', ELoadingStatus.init),
        ],
        wait: const Duration(milliseconds: 100),
      );

      tearDown(() {
        writeDiaryBloc.close();
      });
    },
  );

  /// ============================================
  /// OTHER ERROR CASE TEST
  /// ============================================
  group(
    '[ERROR - 4000] $WriteDiaryBloc',
    () {
      late WriteDiaryBloc writeDiaryBloc;

      setUp(() {
        writeDiaryBloc = WriteDiaryBloc(
          diaryRepository: MockDudeDiaryRepository(
            delay: 10,
            errorCode: 4000,
          ),
          httpMethod: EHttpMethod.post,
        );
      });

      test('Initialize', () {
        expect(writeDiaryBloc.state, const WriteDiaryState.init());
      });

      blocTest<WriteDiaryBloc, WriteDiaryState>(
        'Write Diary',
        build: () => writeDiaryBloc,
        act: (bloc) => bloc.add(WriteDiaryUpload(
          DiaryModel(
            id: 1,
            content: 'test content',
            emotion: EEmotion.happy,
            isOpen: false,
            time: DateTime.now(),
            userId: 1,
          ),
        )),
        expect: () => [
          isA<WriteDiaryState>().having(
              (state) => state.status, 'status', ELoadingStatus.loading),
          isA<WriteDiaryState>()
              .having((state) => state.status, 'status', ELoadingStatus.error)
              .having((state) => state.message, 'message',
                  '[4000] ERROR WITH 4000'),
          isA<WriteDiaryState>()
              .having((state) => state.status, 'status', ELoadingStatus.init),
        ],
        wait: const Duration(milliseconds: 100),
      );

      tearDown(() {
        writeDiaryBloc.close();
      });
    },
  );
}
