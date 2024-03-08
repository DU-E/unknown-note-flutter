// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      userId: json['user_id'] as int?,
      nickName: json['nickname'] as String?,
      introduce: json['introduction'] as String?,
      profileImg: json['profile_img'] as String?,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'nickname': instance.nickName,
      'introduction': instance.introduce,
      'profile_img': instance.profileImg,
    };
