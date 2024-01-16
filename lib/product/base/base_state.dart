import 'package:subscriptionfairy/product/model/subscription_list/subscriptions_list.dart';
import 'package:subscriptionfairy/product/model/users/users.dart';

abstract class AppState {}

class AppLoadingState extends AppState {}

class AppLoadedState extends AppState {
  AppLoadedState(this.users, this.subscriptions);
  final Users users;
  final List<SubscriptionsList> subscriptions;
}

class AppErrorState extends AppState {
  AppErrorState(this.error);
  final String error;
}
