import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:subscriptionfairy/product/model/subscriptions.dart';

/// FirebaseFireStoreServiceInterface
abstract class FirebaseFireStoreServiceInterface {
  /// Default constructor
  FirebaseFireStoreServiceInterface(this.firestore);

  /// Get subscriptions
  Future<List<Subscriptions>> getSubscriptions();

  /// Firestore instance
  final FirebaseFirestore firestore;
}
