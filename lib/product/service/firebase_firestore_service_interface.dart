import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:subscriptionfairy/product/model/subscription_list/subscriptions_list.dart';

/// FirebaseFireStoreServiceInterface
abstract class FirebaseFireStoreServiceInterface {
  /// Default constructor
  FirebaseFireStoreServiceInterface(this.firestore);

  /// Get subscriptions
  Future<List<SubscriptionsList>> getSubscriptions();

  /// Firestore instance
  final FirebaseFirestore firestore;
}
