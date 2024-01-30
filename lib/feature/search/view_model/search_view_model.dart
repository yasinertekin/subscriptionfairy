import 'package:flutter/material.dart';
import 'package:subscriptionfairy/product/model/subscription_list/subscriptions_list.dart';

/// SearchViewModel
final class SearchViewModel extends ChangeNotifier {
  /// Default constructor
  List<SubscriptionsList> subscriptions = [];

  /// Search
  void search(String text, List<SubscriptionsList> subscriptions) {
    final filteredSubscriptions = subscriptions
        .where(
          (subscription) =>
              subscription.subscriptionName!.toLowerCase().contains(
                    text.toLowerCase(),
                  ),
        )
        .toList();
    this.subscriptions = filteredSubscriptions;
    notifyListeners();
  }
}
