import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:gen/src/index.dart';
import 'package:kartal/kartal.dart';
import 'package:subscriptionfairy/product/initialize/language/locale_keys.g.dart';

/// SignInWithGoogleButton is a [StatelessWidget]
final class SignInWithGoogleButton extends StatelessWidget {
  /// Constructor of SignInWithGoogleButton
  const SignInWithGoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.sized.dynamicHeight(0.42),
      height: context.sized.dynamicHeight(0.07),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 5,
          surfaceTintColor: ColorName.colorWhite,
          backgroundColor: ColorName.colorWhite,
          shape: RoundedRectangleBorder(
            borderRadius: context.border.normalBorderRadius,
          ),
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.icons.icGoogleLogo.svg(
              package: 'gen',
            ),
            context.sized.emptySizedWidthBoxLow3x,
            Text(
              LocaleKeys.auth_signWithGoogle,
              style: context.general.textTheme.titleLarge!.copyWith(
                color: ColorName.colorBlack,
              ),
            ).tr(),
          ],
        ),
      ),
    );
  }
}
