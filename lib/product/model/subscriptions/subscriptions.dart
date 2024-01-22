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
    // ignore: invalid_annotation_target
    @JsonKey(name: 'isSubscribed') bool? isSubscribed,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'subscription_icon') String? subscriptionIcon,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'subId') String? subId,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'endDate') DateTime? endDate,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'startDate') DateTime? startDate,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'subscriptionPrice') double? price,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'subscription_length') double? subscriptionLength,
  }) = _Subscriptions;

  /// Converts a Subscriptions instance to json
  factory Subscriptions.fromJson(Map<String, Object?> json) =>
      _$SubscriptionsFromJson(json);
}
