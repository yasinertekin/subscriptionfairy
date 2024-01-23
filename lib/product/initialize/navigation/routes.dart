import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:subscriptionfairy/feature/auth/register/view/register_view.dart';
import 'package:subscriptionfairy/feature/auth/sign/view/sign_view.dart';
import 'package:subscriptionfairy/feature/dashboard/deprecated_dashboard.dart';
import 'package:subscriptionfairy/feature/date_picker/view/date_picker_view.dart';
import 'package:subscriptionfairy/feature/search/view/search_view.dart';
import 'package:subscriptionfairy/feature/subscriptions_detail/view/subscriptions_detail_view.dart';

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

  /// [datePicker] is a function that returns date picker
  static const String datePicker = 'datePicker';

  /// [search] is a function that returns search
  static const String search = 'search';

  /// [getRouteTable] is a function that returns route table
  static Map<String, WidgetBuilder> getRouteTable() {
    return {
      initialRoute: (context) => FirebaseAuth.instance.currentUser != null
          ? const DashboardView()
          : const SignView(),
      sign: (context) => const SignView(),
      register: (context) => const RegisterView(),
      bottomNavigationBar: (context) => const DashboardView(),
      subscriptionsDetail: (context) => const SubscriptionDetailView(),
      datePicker: (context) => const DatePickerView(),
      search: (context) => const SearchView(),
    };
  }
}
