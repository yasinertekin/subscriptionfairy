import 'package:flutter/material.dart';
import 'package:subscriptionfairy/product/initialize/theme/color_schemes.g.dart';
import 'package:subscriptionfairy/product/initialize/theme/custom_theme.dart';

/// CustomLightTheme
final class CustomLightTheme implements CustomTheme {
  @override
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        colorScheme: CustomColorScheme.lightColorScheme,
        inputDecorationTheme: inputDecorationTheme,
      );

  @override
  InputDecorationTheme get inputDecorationTheme => InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      );
}
