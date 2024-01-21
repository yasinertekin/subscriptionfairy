part of '../subscriptions_view.dart';

final class _SubscriptionViewAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _SubscriptionViewAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Subscriptions'),
      centerTitle: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
