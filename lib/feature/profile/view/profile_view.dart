import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:subscriptionfairy/feature/profile/view_model/mixin/profile_view_mixin.dart';
import 'package:subscriptionfairy/product/initialize/language/locale_keys.g.dart';
import 'package:subscriptionfairy/product/utility/enum/profile.dart';

part 'widget/profile_app_bar.dart';
part 'widget/profile_list_tile.dart';

/// This is the view for the bottom navigation bar feature.
final class ProfileView extends StatefulWidget {
  /// Constructor of ProfileView
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

final class _ProfileViewState extends State<ProfileView> with ProfileViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _ProfileAppBar(),
      body: ListView.builder(
        itemCount: Profile.values.length,
        itemBuilder: (context, index) {
          return _ProfileListTile(
            index,
            () {
              switch (Profile.values[index]) {
                case Profile.signOut:
                  signOut();
                case Profile.changeTheme:
                  changeTheme(context);
                case Profile.changeLanguage:
                  changeLanguage(context);
              }
            },
          );
        },
      ),
    );
  }
}
