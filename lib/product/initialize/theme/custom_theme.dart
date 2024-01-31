import 'package:flutter/material.dart';

/// An abstract class representing a custom theme configuration.
abstract class CustomTheme {
  /// The primary [ThemeData] for the application.
  ThemeData get themeData;

  /// The [InputDecorationTheme] for the application.
  InputDecorationTheme get inputDecorationTheme;

  /// The [TabBarTheme] for the application.
  TabBarTheme get tabBarTheme;

  /// BottomAppBarTheme
  BottomAppBarTheme get bottomAppBarTheme;

  /// This is the floating action button theme.
  FloatingActionButtonThemeData get floatingActionButtonTheme;
}
