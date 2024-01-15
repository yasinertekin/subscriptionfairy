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
            StringConstants.register,
            style: context.general.textTheme.headlineMedium,
          ),
          Text(
            'Please register to continue',
            style: context.general.textTheme.headlineSmall,
          ),
          Text.rich(
            TextSpan(
              text: 'Already have an account? ',
              children: [
                WidgetSpan(
                  child: GestureDetector(
                    onTap: () {
                      NavigationService.instance.navigateToPage(
                        path: Routes.initialRoute,
                      );
                    },
                    child: Text(
                      StringConstants.signIn,
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
