import 'package:flutter/material.dart';

/// [NavigationService] is a class that contains
final class NavigationService {
  NavigationService._init();
  static final NavigationService _instance = NavigationService._init();

  /// [NavigationService] constructor
  static NavigationService get instance => _instance;

  /// [navigatorKey] is a [GlobalKey] for [NavigatorState]
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  /// [navigateToPage] is a method that navigates to a page
  Future<void> navigateToPage({required String path, Object? data}) async {
    await navigatorKey.currentState!.pushNamed(path, arguments: data);
  }

  /// Navigate to back
  Future<void> navigateToBack() async {
    navigatorKey.currentState!.pop();
  }
}
