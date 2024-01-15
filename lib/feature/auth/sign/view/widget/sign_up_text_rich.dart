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
            StringConstants.signIn,
            style: context.general.textTheme.headlineLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text.rich(
            TextSpan(
              text: StringConstants.dontHaveAnAccount,
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
                      StringConstants.signUp,
                      style: context.general.textTheme.bodyLarge!.copyWith(
                        color: ColorName.colorRed,
                      ),
                    ),
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
