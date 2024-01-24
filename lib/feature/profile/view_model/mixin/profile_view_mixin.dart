import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subscriptionfairy/feature/profile/view/profile_view.dart';
import 'package:subscriptionfairy/product/core/theme/theme.dart';
import 'package:subscriptionfairy/product/initialize/localization/project_localization.dart';
import 'package:subscriptionfairy/product/initialize/navigation/navigation_service.dart';
import 'package:subscriptionfairy/product/initialize/navigation/routes.dart';
import 'package:subscriptionfairy/product/initialize/theme/custom_light_theme.dart';

/// This is the view for the bottom navigation bar feature  .
mixin ProfileViewMixin on State<ProfileView> {
  /// sign out from the app and navigate to sign in page
  void signOut() {
    FirebaseAuth.instance.signOut();
    NavigationService.instance.navigateToPage(
      path: Routes.sign,
    );
  }

  /// change theme of the app
  void changeTheme(BuildContext context) {
    context.read<ThemeCubit>().state.themeData == CustomLightTheme().themeData
        ? context.read<ThemeCubit>().setDarkTheme()
        : context.read<ThemeCubit>().setLightTheme();
  }

  /// change language of the app

  void changeLanguage(BuildContext context) {
    if (context.locale == Locales.tr.locale) {
      ProductLocalization.updateLanguage(
        context: context,
        value: Locales.en,
      );
    } else {
      ProductLocalization.updateLanguage(
        context: context,
        value: Locales.tr,
      );
    }
  }
}
