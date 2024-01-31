part of '../home_view.dart';

final class _SubscriptionDetailsExpansionTile extends StatelessWidget {
  const _SubscriptionDetailsExpansionTile({
    required this.totalPrices,
    required this.subscriptionList,
  });

  final num? totalPrices;
  final List<Subscriptions>? subscriptionList;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Text(
        LocaleKeys.home_content,
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
          trailing: '${subscriptionList!.length}',
        ),
        _SubscriptionDetailsListTile(
          iconColor: ColorName.colorRed,
          icon: const Icon(
            Icons.subscriptions,
          ),
          title: LocaleKeys.home_totalSubscriptions,
          trailing:
              '${subscriptionList?.where((element) => element.isSubscribed == true).length}',
        ),
      ],
    );
  }
}
