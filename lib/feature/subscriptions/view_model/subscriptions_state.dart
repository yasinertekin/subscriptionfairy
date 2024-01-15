// State sınıfları
import 'package:subscriptionfairy/product/model/subscriptions.dart';

abstract class SubscriptionsState {}

class SubscriptionsLoading extends SubscriptionsState {}

class SubscriptionsLoaded extends SubscriptionsState {
  SubscriptionsLoaded(this.subscriptions);
  final List<Subscriptions> subscriptions;
}

class SubscriptionsError extends SubscriptionsState {
  SubscriptionsError(this.errorMessage);
  final String errorMessage;
}
