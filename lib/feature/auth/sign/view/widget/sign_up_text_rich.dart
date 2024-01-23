part of '../sign_view.dart';

final class _SignUpTextRich extends StatelessWidget {
  const _SignUpTextRich();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.auth_signIn.tr(),
            style: context.general.textTheme.headlineLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ).tr(),
          Text.rich(
            TextSpan(
              text: LocaleKeys.auth_login_dontHaveAccount.tr(),
              style: context.general.textTheme.bodyLarge!.copyWith(
                color: ColorName.colorGrey,
              ),
              children: [
                WidgetSpan(
                  child: GestureDetector(
                    onTap: () {
                      NavigationService.instance
                          .navigateToPage(path: Routes.register);
                    },
                    child: Text(
                      LocaleKeys.auth_login_signUp,
                      style: context.general.textTheme.bodyLarge!.copyWith(
                        color: ColorName.colorRed,
                      ),
                    ).tr(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
