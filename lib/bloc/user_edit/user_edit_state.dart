import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unknown_note_flutter/enums/enum_loading_status.dart';
import 'package:unknown_note_flutter/models/user/user_model.dart';

class UserEditState extends Equatable {
  final ELoadingStatus status;
  final UserModel user;
  final XFile? image;
  final bool removeImage;
  final String? message;

  const UserEditState({
    required this.status,
    required this.user,
    this.image,
    required this.removeImage,
    this.message,
  });

  UserEditState.init({UserModel? user})
      : status = ELoadingStatus.init,
        user = user ?? UserModel(),
        image = null,
        removeImage = false,
        message = null;

  UserEditState copyWith({
    ELoadingStatus? status,
    UserModel? user,
    XFile? image,
    bool? removeImage,
    String? message,
  }) =>
      UserEditState(
        status: status ?? this.status,
        user: user ?? this.user,
        image: image ?? this.image,
        removeImage: removeImage ?? this.removeImage,
        message: message ?? this.message,
      );

  @override
  List<Object?> get props => [
        status,
        user,
        image,
        removeImage,
        message,
      ];
}
