import 'package:subscriptionfairy/product/model/subscription_list/subscriptions_list.dart';
import 'package:subscriptionfairy/product/service/firebase_firestore_service_interface.dart';

/// FirebaseFireStoreService
final class FirebaseFireStoreService extends FirebaseFireStoreServiceInterface {
  /// Default constructor
  FirebaseFireStoreService(super.firestore);

  @override
  Future<List<SubscriptionsList>> getSubscriptions() async {
    final snapshot = await firestore.collection('subscriptions').get();

    if (snapshot.docs.isNotEmpty) {
      // Eğer snapshot boş değilse, snapshot'ı SubscriptionsList'e çevir

      return snapshot.docs
          .map(
            (doc) => SubscriptionsList.fromJson(
              doc.data(),
            ),
          )
          .toList();
    } else {
      // Eğer snapshot boşsa, boş bir liste döndür

      return [];
    }
  }
}
