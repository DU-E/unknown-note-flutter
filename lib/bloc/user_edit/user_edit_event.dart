import 'package:image_picker/image_picker.dart';

abstract class UserEditEvent {}

/// image == null -> remove image
class UserEditChangeImage extends UserEditEvent {
  final XFile? image;

  UserEditChangeImage(this.image);
}

class UserEditChangeNickName extends UserEditEvent {
  final String nickName;

  UserEditChangeNickName(this.nickName);
}

class UserEditChangeIntroduce extends UserEditEvent {
  final String introduce;

  UserEditChangeIntroduce(this.introduce);
}

class UserEditSubmit extends UserEditEvent {}
