import 'package:flutter/material.dart';
import 'package:subscriptionfairy/product/initialize/language/locale_keys.g.dart';

/// [StringConstants] is a class that contains all string constants.
@immutable
final class StringConstants {
  const StringConstants._();

  static const String home = 'Home';

  static const String add = 'Add';

  static const String Profile = 'Profile';

  static const String unknownState = 'Unknown state';

  /// Home View
  static const String mySubscriptions = 'My Subscriptions';

  /// start date
  static const String startDate = LocaleKeys.home_startDate;

  /// end date
  static const String endDate = LocaleKeys.home_endDate;

  /// subscription details
  static const String subscriptionsDetails = 'Subscription Details';

  /// total subscription
  static const String totalSubscription = LocaleKeys.home_totalSubscriptions;

  /// active subscriptions
  static const String activeSubscriptions = LocaleKeys.home_activeSubscriptions;

  static const String tl = 'TL';

  /// search
  static const String search = 'Search';

  static const String subscriptionPlan = 'Subscription Plan';
}
