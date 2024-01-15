import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:subscriptionfairy/feature/auth/register/view/register_view.dart';
import 'package:subscriptionfairy/feature/auth/sign/view/sign_view.dart';
import 'package:subscriptionfairy/feature/bottom_navigation_bar/bottom_navigation_bar.dart';

/// [Routes] is a class that contains all the routes
@immutable
final class Routes {
  /// [Routes] is a class that contains all the routes
  static const String sign = 'sign';

  static const String register = 'register';

  static const String bottomNavigationBar = 'bottomNavigationBar';

  /// [initialRoute] is a function that returns initial route
  static String get initialRoute => 'initialRoute';

  /// [getRouteTable] is a function that returns route table
  static Map<String, WidgetBuilder> getRouteTable() {
    return {
      initialRoute: (context) =>
          User == null ? const SignView() : const CustomBottomNavigationBar(),
      sign: (context) => const SignView(),
      register: (context) => const RegisterView(),
      bottomNavigationBar: (context) => const CustomBottomNavigationBar(),
    };
  }
}
