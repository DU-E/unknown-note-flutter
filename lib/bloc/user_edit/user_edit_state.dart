import 'package:image_picker/image_picker.dart';
import 'package:unknown_note_flutter/bloc/abs_bloc_state.dart';
import 'package:unknown_note_flutter/enums/enum_loading_status.dart';
import 'package:unknown_note_flutter/models/user/user_model.dart';

class UserEditState extends BlocState {
  final UserModel user;
  final XFile? image;
  final bool removeImage;

  const UserEditState({
    required this.user,
    this.image,
    required this.removeImage,
    required super.status,
    super.message,
  });

  UserEditState.init({UserModel? user})
      : user = user ?? UserModel(),
        image = null,
        removeImage = false,
        super(
          status: ELoadingStatus.init,
        );

  @override
  UserEditState copyWith({
    UserModel? user,
    XFile? image,
    bool? removeImage,
    ELoadingStatus? status,
    String? message,
  }) =>
      UserEditState(
        user: user ?? this.user,
        image: image ?? this.image,
        removeImage: removeImage ?? this.removeImage,
        status: status ?? this.status,
        message: message ?? this.message,
      );

  @override
  List<Object?> get props => [
        user,
        image,
        removeImage,
        status,
        message,
      ];
}
