// Cubit sınıfı
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subscriptionfairy/feature/subscriptions/view_model/subscriptions_state.dart';
import 'package:subscriptionfairy/product/service/firebase_firestore_service_interface.dart';

/// SubscriptionsCubit
final class SubscriptionsCubit extends Cubit<SubscriptionsState> {
  /// Default constructor
  SubscriptionsCubit(this.firebaseService) : super(SubscriptionsLoading()) {
    fetchSubscriptions();
  }

  /// FirebaseFireStoreServiceInterface
  final FirebaseFireStoreServiceInterface firebaseService;

  /// Firestore'dan veriyi çeken metot
  Future<void> fetchSubscriptions() async {
    emit(SubscriptionsLoading());

    try {
      final subscriptions = await firebaseService.getSubscriptions();
      emit(SubscriptionsLoaded(subscriptions));
    } catch (e) {
      emit(SubscriptionsError('Error fetching subscriptions: $e'));
    }
  }
}
