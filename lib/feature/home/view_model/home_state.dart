// Define the states for your Cubit
import 'package:subscriptionfairy/product/model/users/users.dart';

// Define the states for your Cubit
abstract class UsersState {}

class UsersInitialState extends UsersState {}

class UsersLoadingState extends UsersState {}

class UsersLoadedState extends UsersState {
  UsersLoadedState(this.users);
  final Users users;
}

class UsersErrorState extends UsersState {
  UsersErrorState(this.error);
  final String error;
}

// Define the events for your Cubit
abstract class UsersEvent {}

class GetUsersSubscriptionsEvent extends UsersEvent {
  GetUsersSubscriptionsEvent(this.usersUid);
  final String usersUid;
}
