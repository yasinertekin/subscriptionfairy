// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscriptions_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubscriptionsListImpl _$$SubscriptionsListImplFromJson(
        Map<String, dynamic> json) =>
    _$SubscriptionsListImpl(
      name: (json['subscription_list'] as List<dynamic>?)
          ?.map((e) => Subscriptions.fromJson(e as Map<String, dynamic>))
          .toList(),
      subscriptionName: json['subscription_name'] as String?,
      subscriptionIcon: json['subscription_icon'] as String?,
    );

Map<String, dynamic> _$$SubscriptionsListImplToJson(
        _$SubscriptionsListImpl instance) =>
    <String, dynamic>{
      'subscription_list': instance.name,
      'subscription_name': instance.subscriptionName,
      'subscription_icon': instance.subscriptionIcon,
    };
