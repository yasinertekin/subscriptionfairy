import 'package:flutter/material.dart';

/// Tab views
enum TabViews {
  /// Subscription
  home,

  /// Notifications
  categories,

  /// offers
  offers,
}

/// TabViewsExtension
extension TabViewsExtension on TabViews {
  /// icon
  Widget getIcon() {
    switch (this) {
      case TabViews.home:
        return const Icon(
          Icons.home,
        );
      case TabViews.categories:
        return const FloatingActionButton(
          onPressed: null,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        );
      case TabViews.offers:
        return const Icon(
          Icons.person,
        );
    }
  }
}
