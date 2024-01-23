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
import 'package:subscriptionfairy/product/utility/enum/profile.dart';

/// This is the view for the bottom navigation bar feature.
final class ProfileView extends StatelessWidget {
  /// Constructor of ProfileView
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _ProfileAppBar(),
      body: ListView.builder(
        itemCount: Profile.values.length,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              ListTile(
                title: Text(Profile.values[index].name),
                trailing: Profile.values[index].icon,
                onTap: () {
                  switch (Profile.values[index]) {
                    case Profile.signOut:
                      FirebaseAuth.instance.signOut();
                      NavigationService.instance.navigateToPage(
                        path: Routes.sign,
                      );
                    case Profile.changeTheme:
                      context.read<ThemeCubit>().state.themeData ==
                              CustomLightTheme().themeData
                          ? context.read<ThemeCubit>().setDarkTheme()
                          : context.read<ThemeCubit>().setLightTheme();

                    case Profile.changeLanguage:
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

final class _ProfileAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _ProfileAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Text(
        LocaleKeys.profile_title,
      ).tr(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
