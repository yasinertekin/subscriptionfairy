part of '../home_view.dart';

final class _SubscriptionDetailsExpansionTile extends StatelessWidget {
  const _SubscriptionDetailsExpansionTile({
    required this.totalPrices,
    required this.state,
  });

  final num? totalPrices;
  final AppLoadedState state;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        StringConstants.subscriptionsDetails,
        style: context.general.textTheme.bodySmall?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      children: [
        _SubscriptionDetailsListTile(
          iconColor: ColorName.colorGreen,
          icon: const Icon(
            Icons.attach_money,
          ),
          title: StringConstants.totalPrices,
          trailing: '${totalPrices?.toStringAsFixed(2)} \$',
        ),
        _SubscriptionDetailsListTile(
          iconColor: ColorName.colorGrey,
          icon: const Icon(
            Icons.subscriptions,
          ),
          title: StringConstants.totalSubscription,
          trailing: '${state.users.subscriptionList?.length}',
        ),
        _SubscriptionDetailsListTile(
          iconColor: ColorName.colorRed,
          icon: const Icon(
            Icons.subscriptions,
          ),
          title: StringConstants.activeSubscriptions,
          trailing: '${state.users.subscriptionList?.where(
                (element) => element.isSubscribed == true,
              ).length}',
        ),
      ],
    );
  }
}
