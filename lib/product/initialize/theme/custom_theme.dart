import 'package:flutter/material.dart';

/// An abstract class representing a custom theme configuration.
abstract class CustomTheme {
  /// The primary [ThemeData] for the application.
  ThemeData get themeData;

  InputDecorationTheme get inputDecorationTheme;
}
