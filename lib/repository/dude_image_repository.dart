import 'dart:io';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unknown_note_flutter/dio/auth_interceptor.dart';
import 'package:unknown_note_flutter/models/res/res_model.dart';
import 'package:unknown_note_flutter/repository/interface/interfece_dude_image_repository.dart';

class DudeImageRepository implements IDudeImageRepository {
  @override
  Future<ResModel<String>> postImage({
    required XFile image,
    String? name,
  }) async {
    Dio dio = Dio();
    dio.interceptors.add(AuthInterceptor(
      contentType: 'multipart/form-data',
    ));
    // Convert to Multipart
    MultipartFile mulImage = await MultipartFile.fromFile(
      File(image.path).path,
      filename: name ?? image.path,
    );
    // Create formdata
    FormData formData = FormData.fromMap({
      'file': mulImage,
    });
    // Post
    var res = await dio.post(
      '/image',
      data: formData,
    );

    var resModel = ResModel<String>.fromJson(
      res.data,
      (json) => json.toString(),
    );

    return resModel;
  }
}
