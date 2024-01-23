part of '../register_view.dart';

final class _RegisterHeader extends StatelessWidget {
  const _RegisterHeader();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.auth_register_title,
            style: context.general.textTheme.headlineMedium,
          ).tr(),
          Text(
            LocaleKeys.auth_register_content,
            style: context.general.textTheme.headlineSmall,
          ).tr(),
          Text.rich(
            TextSpan(
              text: LocaleKeys.auth_register_description.tr(),
              style: context.general.textTheme.bodyLarge?.copyWith(
                color: ColorName.colorGrey,
              ),
              children: [
                WidgetSpan(
                  child: GestureDetector(
                    onTap: () {
                      NavigationService.instance.navigateToPage(
                        path: Routes.initialRoute,
                      );
                    },
                    child: Text(
                      LocaleKeys.auth_signIn,
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
