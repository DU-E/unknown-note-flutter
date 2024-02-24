import 'package:equatable/equatable.dart';
import 'package:unknown_note_flutter/enums/enum_loading_status.dart';
import 'package:unknown_note_flutter/models/user/user_profile_model.dart';

class UserInfoState extends Equatable {
  final ELoadingStatus status;
  final int? userId;
  final UserProfileModel? userProfile;
  final String? message;

  const UserInfoState({
    required this.status,
    this.userId,
    this.userProfile,
    this.message,
  });

  const UserInfoState.init()
      : status = ELoadingStatus.init,
        userId = null,
        userProfile = null,
        message = null;

  UserInfoState copyWith({
    ELoadingStatus? status,
    int? userId,
    UserProfileModel? userProfile,
    String? message,
  }) =>
      UserInfoState(
        status: status ?? this.status,
        userId: userId ?? this.userId,
        userProfile: userProfile ?? this.userProfile,
        message: message ?? this.message,
      );

  @override
  List<Object?> get props => [
        status,
        userId,
        userProfile,
        message,
      ];
}
