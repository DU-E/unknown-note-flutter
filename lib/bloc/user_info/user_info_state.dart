import 'package:equatable/equatable.dart';
import 'package:unknown_note_flutter/enums/enum_loading_status.dart';
import 'package:unknown_note_flutter/models/user/user_profile_model.dart';

class UserInfoState extends Equatable {
  final ELoadingStatus status;
  final ELoadingStatus subStatus;
  final int? userId;
  final UserProfileModel? userProfile;
  final String? message;

  const UserInfoState({
    required this.status,
    required this.subStatus,
    this.userId,
    this.userProfile,
    this.message,
  });

  const UserInfoState.init()
      : status = ELoadingStatus.init,
        subStatus = ELoadingStatus.init,
        userId = null,
        userProfile = null,
        message = null;

  UserInfoState copyWith({
    ELoadingStatus? status,
    ELoadingStatus? subStatus,
    int? userId,
    UserProfileModel? userProfile,
    String? message,
  }) =>
      UserInfoState(
        status: status ?? this.status,
        subStatus: subStatus ?? this.subStatus,
        userId: userId ?? this.userId,
        userProfile: userProfile ?? this.userProfile,
        message: message ?? this.message,
      );

  @override
  List<Object?> get props => [
        status,
        subStatus,
        userId,
        userProfile,
        message,
      ];
}
