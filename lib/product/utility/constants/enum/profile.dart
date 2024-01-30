import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:subscriptionfairy/product/initialize/language/locale_keys.g.dart';

/// Profile enum is used to create a list of items for the profile view.
enum Profile {
  ///changeTheme is used to change the theme of the app.
  changeTheme,

  ///changeLanguage is used to change the language of the app.
  changeLanguage,

  ///signOut is used to sign out from the app.
  signOut,
}

/// Profile extension is used to get the name and icon of the profile enum.
extension ProfileExtension on Profile {
  /// name is used to get the name of the profile enum.
  String get name {
    switch (this) {
      case Profile.signOut:
        return LocaleKeys.profile_signOut.tr();
      case Profile.changeTheme:
        return LocaleKeys.profile_changeTheme.tr();
      case Profile.changeLanguage:
        return LocaleKeys.profile_changeLanguage.tr();
    }
  }

  /// icon is used to get the icon of the profile enum.
  Widget get icon {
    switch (this) {
      case Profile.signOut:
        return const Icon(Icons.logout);
      case Profile.changeTheme:
        return const Icon(Icons.color_lens);
      case Profile.changeLanguage:
        return const Icon(Icons.language);
    }
  }
}
