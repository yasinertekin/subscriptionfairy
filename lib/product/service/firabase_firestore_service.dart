import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:subscriptionfairy/product/model/subscription_list/subscriptions_list.dart';
import 'package:subscriptionfairy/product/model/subscriptions/subscriptions.dart';
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

  @override
  Future<Users> addSubscription(
    String usersUid,
    Subscriptions subscription,
  ) async {
    final snapshot = await firestore.collection('users').doc(usersUid).get();

    if (snapshot.exists) {
      // Eğer snapshot varsa, snapshot'ı Users'a çevir
      final users = Users.fromJson(
        snapshot.data()!,
      );

      // Eğer subscriptionList boş değilse, subscriptionList'e subscription'ı ekle
      if (users.subscriptionList != null) {
        users.subscriptionList!.add(subscription);
      } else {
        await firestore.collection('users').doc(usersUid).update(
              users.copyWith(
                subscriptionList: [subscription],
              ).toJson(),
            );
      }

      await firestore.collection('users').doc(users.usersUid).update(
            users
                .copyWith(
                  subscriptionList: users.subscriptionList,
                )
                .toJson(),
          );

      // Güncellenmiş kullanıcıyı döndür
      return users;
    } else {
      // Eğer snapshot yoksa, boş bir Users döndür
      return const Users(
        subscriptionList: [],
        username: '',
        email: '',
        usersUid: '',
      );
    }
  }

  @override
  Future<Users> addSubscriptionToUser(
    String userUid,
    Subscriptions subscription,
  ) async {
    final usersCollection = FirebaseFirestore.instance.collection('users');

    try {
      // Kullanıcının döküman referansını al
      final DocumentReference userDocRef = usersCollection.doc(userUid);

      // Kullanıcının mevcut verilerini çek
      final userDocSnapshot = await userDocRef.get();

      if (userDocSnapshot.exists) {
        // Kullanıcının var olan verilerini Users sınıfına dönüştür
        var existingUserData =
            Users.fromJson(userDocSnapshot.data()! as Map<String, dynamic>);

        // Yeni subscription'ı ekleyerek güncelle
        existingUserData = existingUserData.copyWith(
          subscriptionList: [
            ...existingUserData.subscriptionList ?? [],
            subscription,
          ],
        );

        // Güncellenmiş veriyi Firestore'a geri yükle
        await userDocRef.set(existingUserData.toJson());

        // Return the updated Users object
        return existingUserData;
      } else {
        // Kullanıcı dökümanı yoksa hata mesajı verebilirsiniz
        print('Belirtilen kullanıcı bulunamadı.');
      }
    } catch (e) {
      // Hata durumunda hata mesajını yazdırabilirsiniz
      print('Hata oluştu: $e');
    }

    // If an error occurs or the user document doesn't exist, return a default Users object
    return const Users(); // You might want to customize this default Users object based on your needs
  }
}
