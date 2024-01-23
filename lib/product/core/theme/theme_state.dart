// Tema cubiti için event ve state tanımları
import 'package:flutter/material.dart';

/// [ThemeCubit] is a class that contains the theme cubit.
abstract class ThemeEvent {}

/// [LightThemeEvent] .
final class LightThemeEvent extends ThemeEvent {}

/// [DarkThemeEvent]
final class DarkThemeEvent extends ThemeEvent {}

/// [ThemeState] is a class that contains the theme state.
final class ThemeState {
  /// [ThemeState] constructor.
  ThemeState(this.themeData);

  /// [themeData] is a variable that contains the theme data.
  final ThemeData themeData;
}
