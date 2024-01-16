// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscriptions.freezed.dart';
part 'subscriptions.g.dart';

@freezed

/// Subscriptions
class Subscriptions with _$Subscriptions {
  /// Default constructor
  const factory Subscriptions({
    /// name
    // ignore: invalid_annotation_target
    @JsonKey(name: 'name') String? name,

    /// title
    // ignore: invalid_annotation_target
    @JsonKey(name: 'subscription_plan') String? subscriptionPlan,
    @JsonKey(name: 'isSubscribed') bool? subscriptionPlanId,
    @JsonKey(name: 'subscription_icon') String? subscriptionIcon,
    @JsonKey(name: 'subId') String? subId,
  }) = _Subscriptions;

  /// Converts a Subscriptions instance to json
  factory Subscriptions.fromJson(Map<String, Object?> json) =>
      _$SubscriptionsFromJson(json);
}
