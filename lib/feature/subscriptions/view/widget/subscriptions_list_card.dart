part of '../subscriptions_view.dart';

final class _SubscriptionsListCard extends StatelessWidget {
  const _SubscriptionsListCard({
    required this.subscription,
    required this.state,
    required this.index,
  });

  final SubscriptionsList subscription;
  final AppLoadedState state;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const ProjectPadding.allSmall(),
      child: Card(
        child: ListTile(
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.chevron_right,
            ),
          ),
          onTap: () {
            NavigationService.instance.navigateToPage(
              path: Routes.subscriptionsDetail,
              data: state.subscriptions[index],
            );
          },
          leading: ClipRRect(
            borderRadius: context.border.normalBorderRadius,
            child: CustomCachedNetworkImage(
              height: context.sized.dynamicHeight(0.12),
              width: context.sized.dynamicWidth(0.25),
              imageUrl: subscription.subscriptionIcon ?? '',
            ),
          ),
          title: Text(
            subscription.subscriptionName ?? '',
            style: context.general.textTheme.titleLarge?.copyWith(),
          ),
        ),
      ),
    );
  }
}
