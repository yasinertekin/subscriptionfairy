part of '../subscriptions_detail_view.dart';

final class _SubscriptionDetailAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _SubscriptionDetailAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(StringConstants.subscriptionsDetails),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
