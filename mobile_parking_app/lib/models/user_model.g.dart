// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as int?,
      username: json['username'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      email: json['email'] as String,
      type: json['type'] as String?,
      phonePrefix: json['phone_prefix'] as String?,
      phone: json['phone'] as String?,
      firebaseToken: json['firebase_token'] as String?,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'type': instance.type,
      'phone_prefix': instance.phonePrefix,
      'phone': instance.phone,
      'firebase_token': instance.firebaseToken,
    };
