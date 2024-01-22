import 'package:flutter/material.dart';
import 'package:subscriptionfairy/product/model/subscription_list/subscriptions_list.dart';

final class SearchViewModel extends ChangeNotifier {
  List<SubscriptionsList> subscriptions = [];

  void search(String text, List<SubscriptionsList> subscriptions) {
    final filteredSubscriptions = subscriptions
        .where(
          (subscription) =>
              subscription.subscriptionName!.toLowerCase().contains(
                    text,
                  ),
        )
        .toList();
    this.subscriptions = filteredSubscriptions;
    notifyListeners();
  }
}
