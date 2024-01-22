import 'package:flutter/material.dart';
import 'package:gen/src/index.dart';
import 'package:subscriptionfairy/product/initialize/theme/color_schemes.g.dart';
import 'package:subscriptionfairy/product/initialize/theme/custom_theme.dart';

/// CustomLightTheme
final class CustomLightTheme implements CustomTheme {
  @override
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        colorScheme: CustomColorScheme.lightColorScheme,
        inputDecorationTheme: inputDecorationTheme,
        tabBarTheme: tabBarTheme,
        floatingActionButtonTheme: floatingActionButtonTheme,
        bottomAppBarTheme: bottomAppBarTheme,
      );

  @override
  InputDecorationTheme get inputDecorationTheme => InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      );

  @override
  TabBarTheme get tabBarTheme => const TabBarTheme(
        dividerColor: Colors.transparent,
        splashFactory: InkRipple.splashFactory,
        labelColor: ColorName.colorRed,
        unselectedLabelColor: ColorName.colorGrey,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorColor: Colors.transparent,
        tabAlignment: TabAlignment.fill,
        labelPadding: EdgeInsets.zero,
      );

  /// floatingActionButtonTheme
  FloatingActionButtonThemeData get floatingActionButtonTheme =>
      const FloatingActionButtonThemeData(
        backgroundColor: ColorName.colorRed,
        elevation: 10,
        shape: CircleBorder(),
      );

  @override
  BottomAppBarTheme get bottomAppBarTheme => const BottomAppBarTheme(
        elevation: 20,
        shape: CircularNotchedRectangle(),
      );
}
