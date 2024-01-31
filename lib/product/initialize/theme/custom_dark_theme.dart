import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:subscriptionfairy/product/initialize/theme/color_schemes.g.dart';
import 'package:subscriptionfairy/product/initialize/theme/custom_theme.dart';

/// CustomDarkTheme
final class CustomDarkTheme implements CustomTheme {
  @override
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        colorScheme: CustomColorScheme.darkColorScheme,
        inputDecorationTheme: inputDecorationTheme,
        tabBarTheme: tabBarTheme,
        bottomAppBarTheme: bottomAppBarTheme,
        floatingActionButtonTheme: floatingActionButtonTheme,
        textTheme: GoogleFonts.suezOneTextTheme(),
        brightness: Brightness.dark,
      );

  @override
  InputDecorationTheme get inputDecorationTheme => InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      );

  @override
  TabBarTheme get tabBarTheme => TabBarTheme(
        dividerColor: Colors.transparent,
        unselectedLabelColor: Colors.white.withOpacity(0.5),
        indicatorSize: TabBarIndicatorSize.label,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.transparent,
        ),
      );

  @override
  BottomAppBarTheme get bottomAppBarTheme => const BottomAppBarTheme(
        elevation: 20,
        surfaceTintColor: Colors.transparent,
        shape: CircularNotchedRectangle(),
      );
  FloatingActionButtonThemeData get floatingActionButtonTheme =>
      const FloatingActionButtonThemeData(
        elevation: 5,
        shape: CircleBorder(),
      );
}
