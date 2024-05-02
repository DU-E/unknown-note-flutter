import 'package:unknown_note_flutter/models/res/res_model.dart';
import 'package:unknown_note_flutter/utils/mock_dio_error.dart';

mixin MockThrowExceptionMixin {
  /// ### **NOTICE**
  ///
  /// 반드시 [mockedResponse]를 호출한 함수의 리턴값으로 사용해야 합니다. \
  /// 또한, [mockedResponse]의 제네릭 타입은 호출한 함수의 Future\<T\>의 [T]와 같습니다.
  T mockedResponse<T>(
    T Function() mock, {
    int? errorCode,
  }) {
    if (errorCode != null) {
      mockThrowDioError(
        errorModel: ResModel(
          code: errorCode,
          message: 'ERROR WITH $errorCode',
        ),
      );
    }

    return mock();
  }
}
