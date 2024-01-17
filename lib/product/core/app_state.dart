import 'package:subscriptionfairy/product/model/subscription_list/subscriptions_list.dart';
import 'package:subscriptionfairy/product/model/users/users.dart';

/// This is the state of the app.
abstract class AppState {}

/// This is the initial state of the app.
final class AppLoadingState extends AppState {}

/// This is the loaded state of the app.
final class AppLoadedState extends AppState {
  /// This is the constructor for the app loaded state.
  AppLoadedState(this.users, this.subscriptions);

  /// This is the users for the app loaded state.
  final Users users;

  /// This is the subscriptions for the app loaded state.
  final List<SubscriptionsList> subscriptions;
}

/// This is the error state of the app.
final class AppErrorState extends AppState {
  /// This is the constructor for the app error state.
  AppErrorState(this.error);

  /// This is the error for the app error state.
  final String error;
}
