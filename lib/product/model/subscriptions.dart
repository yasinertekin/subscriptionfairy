import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscriptions.freezed.dart';
part 'subscriptions.g.dart';

@freezed

/// Subscriptions
class Subscriptions with _$Subscriptions {
  /// Default constructor
  const factory Subscriptions({
    /// name
    @JsonKey(name: 'name') String? name,

    /// title
    @JsonKey(name: 'title') String? title,
  }) = _Subscriptions;

  /// Converts a Subscriptions instance to json
  factory Subscriptions.fromJson(Map<String, Object?> json) =>
      _$SubscriptionsFromJson(json);
}
