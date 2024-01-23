part of '../subscriptions_view.dart';

final class _SearchSubscriptions extends StatelessWidget {
  const _SearchSubscriptions(
    this.subscriptionsList,
  );

  final SubscriptionsList subscriptionsList;

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      onTap: () {
        NavigationService.instance.navigateToPage(
          path: Routes.search,
          data: subscriptionsList,
        );
      },
      decoration: InputDecoration(
        hintText: LocaleKeys.subscriptions_textFieldHintText.tr(),
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: context.border.normalBorderRadius,
        ),
      ),
    );
  }
}
