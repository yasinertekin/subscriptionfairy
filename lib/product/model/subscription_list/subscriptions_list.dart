// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:subscriptionfairy/product/model/subscriptions/subscriptions.dart';

part 'subscriptions_list.freezed.dart';
part 'subscriptions_list.g.dart';

/// Subscriptions
@freezed
class SubscriptionsList with _$SubscriptionsList {
  /// Default constructor
  const factory SubscriptionsList({
    /// name
    // ignore: invalid_annotation_target
    @JsonKey(name: 'subscription_list') List<Subscriptions>? name,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'subscription_name') String? subscriptionName,

    /// icon
    // ignore: invalid_annotation_target
    @JsonKey(name: 'subscription_icon') String? subscriptionIcon,

    /// title
  }) = _SubscriptionsList;

  /// Converts a Subscriptions instance to json
  factory SubscriptionsList.fromJson(Map<String, Object?> json) =>
      _$SubscriptionsListFromJson(json);
}
