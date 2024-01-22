part of '../subscriptions_view.dart';

final class SubscriptionsListCard extends StatelessWidget {
  const SubscriptionsListCard({
    required this.subscription,
    required this.state,
    required this.index,
    super.key,
  });

  final SubscriptionsList subscription;
  final AppLoadedState state;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const ProjectPadding.allSmall(),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const ProjectPadding.allSmall(),
          child: ListTile(
            trailing: const Icon(
              CupertinoIcons.chevron_right,
            ),
            onTap: () {
              NavigationService.instance.navigateToPage(
                path: Routes.subscriptionsDetail,
                data: subscription,
              );
            },
            leading: ClipRRect(
              borderRadius: context.border.normalBorderRadius,
              child: CustomCachedNetworkImage(
                height: context.sized.dynamicHeight(0.1),
                width: context.sized.dynamicWidth(0.15),
                imageUrl: subscription.subscriptionIcon ?? '',
              ),
            ),
            title: Text(
              subscription.subscriptionName ?? '',
              style: context.general.textTheme.titleLarge?.copyWith(),
            ),
          ),
        ),
      ),
    );
  }
}
