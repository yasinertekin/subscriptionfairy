// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:subscriptionfairy/product/model/subscriptions/subscriptions.dart';

part 'users.freezed.dart';
part 'users.g.dart';

/// Subscriptions
@freezed
class Users with _$Users {
  /// Default constructor
  const factory Users({
    /// name
    // ignore: invalid_annotation_target
    @JsonKey(name: 'subscription_list') List<Subscriptions>? subscriptionList,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'username') String? username,

    /// icon
    // ignore: invalid_annotation_target
    @JsonKey(name: 'email') String? email,

    // ignore: invalid_annotation_target
    @JsonKey(name: 'usersUid') String? usersUid,

    /// title
  }) = _Users;

  /// Converts a Subscriptions instance to json
  factory Users.fromJson(Map<String, Object?> json) => _$UsersFromJson(json);
}
