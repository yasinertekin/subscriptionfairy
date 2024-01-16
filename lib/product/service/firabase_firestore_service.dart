import 'package:subscriptionfairy/product/model/subscription_list/subscriptions_list.dart';
import 'package:subscriptionfairy/product/model/users/users.dart';
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

  @override
  Future<Users> getUsersSubscriptions(String usersUid) async {
    final snapshot = await firestore.collection('users').doc(usersUid).get();

    if (snapshot.exists) {
      // Eğer snapshot varsa, snapshot'ı Users'a çevir
      print('snapshot var');
      print(snapshot.data());
      return Users.fromJson(
        snapshot.data()!,
      );
    } else {
      // Eğer snapshot yoksa, boş bir Users döndür
      print('snapshot yok');
      return const Users(
        subscriptionList: [],
        username: '',
        email: '',
        usersUid: '',
      );
    }
  }
}
