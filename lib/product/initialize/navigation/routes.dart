import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:subscriptionfairy/feature/auth/register/view/register_view.dart';
import 'package:subscriptionfairy/feature/auth/sign/view/sign_view.dart';
import 'package:subscriptionfairy/feature/dashboard/dashboard_view.dart';
import 'package:subscriptionfairy/feature/date_picker/date_picker.dart';
import 'package:subscriptionfairy/feature/subscriptions_detail/subscriptions_detail.dart';

/// [Routes] is a class that contains all the routes
@immutable
final class Routes {
  /// [Routes] is a class that contains all the routes
  static const String sign = 'sign';

  /// [Routes] is a class that contains all the routes
  static const String register = 'register';

  /// bottomNavigationBar
  static const String bottomNavigationBar = 'bottomNavigationBar';

  /// subscriptionsDetail
  static const String subscriptionsDetail = 'subscriptionsDetail';

  /// [initialRoute] is a function that returns initial route
  static const String initialRoute = 'initialRoute';

  static const String datePicker = 'datePicker';

  /// [getRouteTable] is a function that returns route table
  static Map<String, WidgetBuilder> getRouteTable() {
    return {
      initialRoute: (context) => FirebaseAuth.instance.currentUser != null
          ? const DashboardView()
          : const SignView(),
      sign: (context) => const SignView(),
      register: (context) => const RegisterView(),
      bottomNavigationBar: (context) => const DashboardView(),
      subscriptionsDetail: (context) => const SubscriptionDetails(),
      datePicker: (context) => const DatePicker(),
    };
  }
}
