import 'package:image_picker/image_picker.dart';
import 'package:unknown_note_flutter/mixins/mock_throw_exception_mixin.dart';
import 'package:unknown_note_flutter/models/res/res_model.dart';
import 'package:unknown_note_flutter/repository/interface/interfece_dude_image_repository.dart';

class MockDudeImageRepository
    with MockThrowExceptionMixin
    implements IDudeImageRepository {
  final int delay;
  final int? errorCode;

  MockDudeImageRepository({
    this.delay = 1000,
    this.errorCode,
  });

  @override
  Future<ResModel<String>> postImage({
    required XFile image,
    String? name,
  }) async {
    await Future.delayed(Duration(milliseconds: delay));

    return mockedResponse<ResModel<String>>(
      () {
        var resTmp = ResModel<String>(
          code: 1000,
          data:
              "https://lh4.googleusercontent.com/on7Yj1rShJRRBy88rTmptLVzMI4gEBDBabmSMv-GGsPIo5umfS5dpSJp3b4EoqKtnxdOYXeHSyct6m2fLYKckaikrUJn91PNWkIYXtkrCljcvdEnGdf_nQM5Qw6bQY4q6jvbWiBcC3WPTIcDS_lizv3R25oVAF_H0PNzvRo7JivPSiZR",
        ).toJson((imgStr) => imgStr);

        var res = ResModel<String>.fromJson(
          resTmp,
          (json) => json.toString(),
        );

        return res;
      },
      errorCode: errorCode,
    );
  }
}
