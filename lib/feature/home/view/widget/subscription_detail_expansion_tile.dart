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
        LocaleKeys.home_content,
        style: context.general.textTheme.bodySmall?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ).tr(),
      children: [
        _SubscriptionDetailsListTile(
          iconColor: ColorName.colorGreen,
          icon: const Icon(
            Icons.attach_money,
          ),
          title: LocaleKeys.home_totalPrice,
          trailing: '${totalPrices?.toStringAsFixed(2)} \$',
        ),
        _SubscriptionDetailsListTile(
          iconColor: ColorName.colorGrey,
          icon: const Icon(
            Icons.subscriptions,
          ),
          title: LocaleKeys.home_totalSubscriptions,
          trailing: '${state.users.subscriptionList?.length}',
        ),
        _SubscriptionDetailsListTile(
          iconColor: ColorName.colorRed,
          icon: const Icon(
            Icons.subscriptions,
          ),
          title: LocaleKeys.home_totalSubscriptions,
          trailing: '${state.users.subscriptionList?.where(
                (element) => element.isSubscribed == true,
              ).length}',
        ),
      ],
    );
  }
}
