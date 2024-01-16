
/*
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subscriptionfairy/feature/home/view_model/home_state.dart';
import 'package:subscriptionfairy/product/firebase/firebase_auth_service_manager.dart';
import 'package:subscriptionfairy/product/service/firebase_firestore_service_interface.dart';

class UsersCubit extends Cubit<UsersState> {
  /// Default constructor
  UsersCubit(this.firebaseService) : super(UsersLoadingState()) {
    getUsersSubscriptions();
  }

  /// FirebaseFireStoreServiceInterface
  final FirebaseFireStoreServiceInterface firebaseService;

  /// Get users subscriptions

  Future<void> getUsersSubscriptions() async {
    try {
      emit(UsersInitialState()); // Set initial state

      final users = await firebaseService.getUsersSubscriptions(
        FirebaseAuthServiceManager
            .instance.firebaseAuthService.firebaseAuth.currentUser!.uid,
      );

      // Check if the retrieved Users object is not empty
      emit(UsersLoadedState(users));
    } catch (e) {
      emit(UsersErrorState('Error fetching user subscriptions: $e'));
    }
  }
}
*/