import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:subscriptionfairy/product/model/subscription_list/subscriptions_list.dart';
import 'package:subscriptionfairy/product/model/subscriptions/subscriptions.dart';
import 'package:subscriptionfairy/product/model/users/users.dart';

/// FirebaseFireStoreServiceInterface
abstract class FirebaseFireStoreServiceInterface {
  /// Default constructor
  FirebaseFireStoreServiceInterface(this.firestore);

  /// Get subscriptions
  Future<List<SubscriptionsList>> getSubscriptions();

  /// Firestore instance
  final FirebaseFirestore firestore;

  /// Get users subscriptions
  Future<Users> getUsersSubscriptions(String usersUid);

  /// Create users
  Future<void> createUsers(Users users);

  /// Create subscriptions
  Future<void> updateSubscriptionList(
    String userId,
    Subscriptions newSubscription,
  );

  /// Delete subscriptions element
  Future<void> deleteSubscriptionsElement(
    String userId,
    Subscriptions newSubscription,
  );

  /// Update Subscriptions
  Future<void> updateSubscriptions(
    Subscriptions newSubscription,
    Subscriptions oldSubscription,
    String userId,
  );
}
