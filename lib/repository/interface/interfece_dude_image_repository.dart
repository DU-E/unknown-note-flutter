import 'package:image_picker/image_picker.dart';
import 'package:unknown_note_flutter/models/res/res_model.dart';

abstract interface class IDudeImageRepository {
  Future<ResModel<String>> postImage({
    required XFile image,
    String? name,
  });
}
