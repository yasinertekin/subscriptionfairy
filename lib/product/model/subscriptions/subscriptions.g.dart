// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscriptions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubscriptionsImpl _$$SubscriptionsImplFromJson(Map<String, dynamic> json) =>
    _$SubscriptionsImpl(
      name: json['name'] as String?,
      subscriptionPlan: json['subscription_plan'] as String?,
      subscriptionPlanId: json['isSubscribed'] as bool?,
      subscriptionIcon: json['subscription_icon'] as String?,
    );

Map<String, dynamic> _$$SubscriptionsImplToJson(_$SubscriptionsImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'subscription_plan': instance.subscriptionPlan,
      'isSubscribed': instance.subscriptionPlanId,
      'subscription_icon': instance.subscriptionIcon,
    };
