// State sınıfları
import 'package:subscriptionfairy/product/model/subscription_list/subscriptions_list.dart';

/// SubscriptionsState is a class that contains all the states
abstract class SubscriptionsState {}

/// SubscriptionsLoading is a class that contains all the states
final class SubscriptionsLoading extends SubscriptionsState {}

/// SubscriptionsLoaded is a class that contains all the states
final class SubscriptionsLoaded extends SubscriptionsState {
  /// Default constructor
  SubscriptionsLoaded(this.subscriptions);

  /// subscriptions
  final List<SubscriptionsList> subscriptions;
}

/// SubscriptionsError is a class that contains all the states
final class SubscriptionsError extends SubscriptionsState {
  /// Default constructor
  SubscriptionsError(this.errorMessage);

  /// errorMessage
  final String errorMessage;
}
