import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart' as ft;
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:unknown_note_flutter/bloc/diary/diary_bloc.dart';
import 'package:unknown_note_flutter/bloc/diary/diary_event.dart';
import 'package:unknown_note_flutter/bloc/diary/diary_state.dart';
import 'package:unknown_note_flutter/constants/strings.dart';
import 'package:unknown_note_flutter/enums/enum_loading_status.dart';
import 'package:unknown_note_flutter/repository/dude_diary_repository.dart';

void main() {
  ft.TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() {
    FlutterSecureStorage.setMockInitialValues({
      Strings.jwtToken: 'jwt_token',
    });
  });

  group(
    DiaryBloc,
    () {
      late DiaryBloc diaryBloc;

      setUp(() {
        diaryBloc = DiaryBloc(
          dudeDiaryRepository: DudeDiaryRepository(),
        );
      });

      test('Initialize', () {
        expect(diaryBloc.state, const DiaryState.init());
      });

      blocTest<DiaryBloc, DiaryState>(
        'Get Random Diary',
        build: () => diaryBloc,
        act: (bloc) => bloc.add(DiaryGet()),
        expect: () => [
          isA<DiaryState>().having(
            (state) => state.status,
            'status',
            ELoadingStatus.loading,
          ),
          isA<DiaryState>().having(
            (state) => state.status,
            'status',
            ELoadingStatus.error,
          ),
        ],
        wait: const Duration(seconds: 2),
      );

      tearDown(() {
        diaryBloc.close();
      });
    },
  );
}
