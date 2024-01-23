import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subscriptionfairy/product/core/theme/theme.dart';
import 'package:subscriptionfairy/product/initialize/language/locale_keys.g.dart';
import 'package:subscriptionfairy/product/initialize/localization/project_localization.dart';
import 'package:subscriptionfairy/product/initialize/navigation/navigation_service.dart';
import 'package:subscriptionfairy/product/initialize/navigation/routes.dart';
import 'package:subscriptionfairy/product/initialize/theme/custom_light_theme.dart';

/// This is the view for the bottom navigation bar feature.
final class ProfileView extends StatelessWidget {
  /// Constructor of ProfileView
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          LocaleKeys.profile_title,
        ).tr(),
      ),
      body: ListView.builder(
        itemCount: profile.values.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                title: Text(profile.values[index].name),
                trailing: profile.values[index].icon,
                onTap: () {
                  switch (profile.values[index]) {
                    case profile.signOut:
                      FirebaseAuth.instance.signOut();
                      NavigationService.instance.navigateToPage(
                        path: Routes.sign,
                      );
                    case profile.changeTheme:
                      context.read<ThemeCubit>().state.themeData ==
                              CustomLightTheme().themeData
                          ? context.read<ThemeCubit>().setDarkTheme()
                          : context.read<ThemeCubit>().setLightTheme();

                    case profile.changeLanguage:
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
                },
              ),
              const Divider(),
            ],
          );
        },
      ),
    );
  }
}

enum profile {
  changeTheme,
  changeLanguage,
  signOut,
}

extension profileExtension on profile {
  String get name {
    switch (this) {
      case profile.signOut:
        return LocaleKeys.profile_signOut.tr();
      case profile.changeTheme:
        return LocaleKeys.profile_changeTheme.tr();
      case profile.changeLanguage:
        return LocaleKeys.profile_changeLanguage.tr();
    }
  }

  Widget get icon {
    switch (this) {
      case profile.signOut:
        return const Icon(Icons.logout);
      case profile.changeTheme:
        return const Icon(Icons.color_lens);
      case profile.changeLanguage:
        return const Icon(Icons.language);
    }
  }
}
