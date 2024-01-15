import 'package:flutter/material.dart';
import 'package:subscriptionfairy/feature/auth/sign/view/sign_view.dart';
import 'package:subscriptionfairy/main.dart';

/// [Routes] is a class that contains all the routes
@immutable
final class Routes {
  /// [Routes] is a class that contains all the routes
  static const String sign = 'sign';

  static const String home = 'home';

  /// [initialRoute] is a function that returns initial route
  static String get initialRoute => 'initialRoute';

  /// [getRouteTable] is a function that returns route table
  static Map<String, WidgetBuilder> getRouteTable() {
    return {
      initialRoute: (context) => const SignView(),
      home: (context) => const HomeView(),
    };
  }
}
