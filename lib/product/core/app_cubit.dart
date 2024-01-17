import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subscriptionfairy/product/core/app_state.dart';
import 'package:subscriptionfairy/product/firebase/firebase_auth_service_manager.dart';
import 'package:subscriptionfairy/product/model/subscriptions/subscriptions.dart';
import 'package:subscriptionfairy/product/service/firebase_firestore_service_interface.dart';

/// This is the cubit for the bottom navigation bar feature.
final class AppCubit extends Cubit<AppState> {
  /// Constructor of AppCubit
  AppCubit(this.firebaseService) : super(AppLoadingState()) {
    fetchData();
  }

  /// This is the service for the firebase.
  final FirebaseFireStoreServiceInterface firebaseService;

  /// This function fetches the data from the firebase.
  Future<void> fetchData() async {
    try {
      final userSubscriptions = await firebaseService.getUsersSubscriptions(
        FirebaseAuthServiceManager
            .instance.firebaseAuthService.firebaseAuth.currentUser!.uid,
      );

      final subscriptions = await firebaseService.getSubscriptions();

      emit(AppLoadedState(userSubscriptions, subscriptions));
    } catch (e) {
      emit(AppErrorState('Error fetching data: $e'));
    }
  }

  /// This function updates the subscription list.
  Future<void> updateSubscriptionList(
    Subscriptions newSubscription,
  ) async {
    try {
      await firebaseService.updateSubscriptionList(
        FirebaseAuthServiceManager
            .instance.firebaseAuthService.firebaseAuth.currentUser!.uid,
        newSubscription,
      );
      // You might want to reload the data after updating the subscription list.
      await fetchData();
    } catch (e) {
      emit(AppErrorState('Error updating subscription list: $e'));
    }
  }

  /// This function deletes the subscription list.
  Future<void> deleteSubscriptionList(
    Subscriptions newSubscription,
  ) async {
    try {
      await firebaseService.deleteSubscriptionsElement(
        FirebaseAuthServiceManager
            .instance.firebaseAuthService.firebaseAuth.currentUser!.uid,
        newSubscription,
      );
      // You might want to reload the data after deleting the subscription list.
      await fetchData();
    } catch (e) {
      emit(AppErrorState('Error deleting subscription list: $e'));
    }
  }
}
