// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UsersImpl _$$UsersImplFromJson(Map<String, dynamic> json) => _$UsersImpl(
      subscriptionList: (json['subscription_list'] as List<dynamic>?)
          ?.map((e) => Subscriptions.fromJson(e as Map<String, dynamic>))
          .toList(),
      username: json['username'] as String?,
      email: json['email'] as String?,
      usersUid: json['usersUid'] as String?,
    );

Map<String, dynamic> _$$UsersImplToJson(_$UsersImpl instance) =>
    <String, dynamic>{
      'subscription_list': instance.subscriptionList,
      'username': instance.username,
      'email': instance.email,
      'usersUid': instance.usersUid,
    };
