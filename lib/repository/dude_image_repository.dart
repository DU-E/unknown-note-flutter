import 'dart:io';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unknown_note_flutter/dio/auth_interceptor.dart';
import 'package:unknown_note_flutter/models/res/res_model.dart';
import 'package:unknown_note_flutter/repository/interface/interfece_dude_image_repository.dart';
import 'package:unknown_note_flutter/utils/mock_dio_error.dart';

class DudeImageRepository implements IDudeImageRepository {
  @override
  Future<ResModel<String>> postImage({
    required XFile image,
    String? name,
  }) async {
    // Dio dio = Dio();
    // dio.interceptors.add(AuthInterceptor(
    //   contentType: 'multipart/form-data',
    // ));
    // // Convert to Multipart
    // MultipartFile mulImage = await MultipartFile.fromFile(
    //   File(image.path).path,
    //   filename: name ?? image.path,
    // );
    // // Create formdata
    // FormData formData = FormData.fromMap({
    //   'file': mulImage,
    // });
    // // Post
    // dio.post(
    //   '/image',
    //   data: formData,
    // );

    // TODO: api connect
    await Future.delayed(const Duration(seconds: 1));

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
  }
}
