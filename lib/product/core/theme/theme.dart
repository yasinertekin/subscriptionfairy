import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subscriptionfairy/product/core/theme/theme_state.dart';
import 'package:subscriptionfairy/product/initialize/theme/custom_dark_theme.dart';
import 'package:subscriptionfairy/product/initialize/theme/custom_light_theme.dart';

/// [ThemeCubit] is a class that contains the theme cubit.
final class ThemeCubit extends Cubit<ThemeState> {
  /// [ThemeCubit] is a class that contains the theme cubit.
  ThemeCubit() : super(ThemeState(_lightTheme));

  static final ThemeData _lightTheme = CustomLightTheme().themeData;

  static final ThemeData _darkTheme = CustomDarkTheme().themeData;

  /// [setLightTheme] is a method that sets the light theme.
  void setLightTheme() => emit(ThemeState(_lightTheme));

  /// [setDarkTheme] is a method that sets the dark theme.
  void setDarkTheme() => emit(ThemeState(_darkTheme));
}
