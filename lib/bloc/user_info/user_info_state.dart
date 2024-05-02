import 'package:unknown_note_flutter/bloc/abs_bloc_state.dart';
import 'package:unknown_note_flutter/enums/enum_loading_status.dart';
import 'package:unknown_note_flutter/models/user/user_profile_model.dart';

class UserInfoState extends BlocState {
  final int? userId;
  final UserProfileModel? userProfile;
  final ELoadingStatus infoStatus;
  final ELoadingStatus subStatus;

  const UserInfoState({
    required this.infoStatus,
    required this.subStatus,
    this.userId,
    this.userProfile,
    required super.status,
    super.message,
  });

  const UserInfoState.init()
      : infoStatus = ELoadingStatus.init,
        subStatus = ELoadingStatus.init,
        userId = null,
        userProfile = null,
        super(
          status: ELoadingStatus.init,
        );

  @override
  UserInfoState copyWith({
    ELoadingStatus? infoStatus,
    ELoadingStatus? subStatus,
    int? userId,
    UserProfileModel? userProfile,
    ELoadingStatus? status,
    String? message,
  }) =>
      UserInfoState(
        infoStatus: infoStatus ?? this.infoStatus,
        subStatus: subStatus ?? this.subStatus,
        userId: userId ?? this.userId,
        userProfile: userProfile ?? this.userProfile,
        status: status ?? this.status,
        message: message ?? this.message,
      );

  @override
  List<Object?> get props => [
        infoStatus,
        subStatus,
        userId,
        userProfile,
        status,
        message,
      ];
}
