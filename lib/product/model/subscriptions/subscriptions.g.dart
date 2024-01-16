// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscriptions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubscriptionsImpl _$$SubscriptionsImplFromJson(Map<String, dynamic> json) =>
    _$SubscriptionsImpl(
      name: json['name'] as String?,
      subscriptionPlan: json['subscription_plan'] as String?,
      isSubscribed: json['isSubscribed'] as bool?,
      subscriptionIcon: json['subscription_icon'] as String?,
      subId: json['subId'] as String?,
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      price: (json['subscriptionPrice'] as num?)?.toDouble(),
      subscriptionLength: (json['subscription_length'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$SubscriptionsImplToJson(_$SubscriptionsImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'subscription_plan': instance.subscriptionPlan,
      'isSubscribed': instance.isSubscribed,
      'subscription_icon': instance.subscriptionIcon,
      'subId': instance.subId,
      'endDate': instance.endDate?.toIso8601String(),
      'startDate': instance.startDate?.toIso8601String(),
      'subscriptionPrice': instance.price,
      'subscription_length': instance.subscriptionLength,
    };
