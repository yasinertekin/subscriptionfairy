import 'package:subscriptionfairy/product/model/subscriptions.dart';
import 'package:subscriptionfairy/product/service/firebase_firestore_service_interface.dart';

/// FirebaseFireStoreService
final class FirebaseFireStoreService extends FirebaseFireStoreServiceInterface {
  /// Default constructor
  FirebaseFireStoreService(super.firestore);

  @override
  Future<List<Subscriptions>> getSubscriptions() async {
    final snapshot = await firestore.collection('subscriptions').get();

    if (snapshot.docs.isNotEmpty) {
      // Eğer snapshot boş değilse, belgeleri dönüştür
      print('Firestore Data: ${snapshot.docs.map((doc) => doc.data())}');

      return snapshot.docs
          .map(
            (doc) => Subscriptions.fromJson(doc.data()),
          )
          .toList();
    } else {
      // Eğer snapshot boşsa, boş bir liste döndür
      print('Firestore Data: Empty');
      return [];
    }
  }
}
