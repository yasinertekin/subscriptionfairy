import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subscriptionfairy/product/base/base_state.dart';
import 'package:subscriptionfairy/product/firebase/firebase_auth_service_manager.dart';
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
}
