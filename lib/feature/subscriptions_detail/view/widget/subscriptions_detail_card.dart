part of '../subscriptions_detail_view.dart';

/// SubscriptionCard
final class _SubscriptionsDetailCard extends StatelessWidget {
  /// Default constructor
  const _SubscriptionsDetailCard({
    required this.receivedSubscriptions,
    required this.index,
    required this.state,
  });

  /// subscriptions
  final SubscriptionsList receivedSubscriptions;

  /// index
  final int index;

  /// state
  final AppLoadedState state;

  @override
  Widget build(BuildContext context) {
    const elevation = 10.0;
    final appCubit = context.read<AppCubit>();
    return Padding(
      padding: const ProjectPadding.allSmall(),
      child: Card(
        elevation: elevation,
        child: Column(
          children: [
            const Spacer(),
            ClipRRect(
              borderRadius: context.border.normalBorderRadius,
              child: CustomCachedNetworkImage(
                height: context.sized.dynamicHeight(0.13),
                width: context.sized.dynamicWidth(0.23),
                imageUrl: receivedSubscriptions.subscriptionIcon.toString(),
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const ProjectPadding.onlyLeftSmall(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          receivedSubscriptions.name?[index].subscriptionPlan
                                  .toString() ??
                              '',
                          style: context.general.textTheme.titleMedium,
                        ),
                        _PriceTextRich(
                          receivedSubscriptions: receivedSubscriptions,
                          index: index,
                        ),
                      ],
                    ),
                  ),
                ),
                _SubscriptionsCardSwitch(
                  state: state,
                  receivedSubscriptions: receivedSubscriptions,
                  index: index,
                  subscriptionsDetailViewModel:
                      context.read<SubscriptionsDetailViewModel>(),
                  appCubit: appCubit,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

final class _PriceTextRich extends StatelessWidget {
  const _PriceTextRich({
    required this.receivedSubscriptions,
    required this.index,
  });

  final SubscriptionsList receivedSubscriptions;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'Price: ',
            style: context.general.textTheme.titleMedium,
          ),
          TextSpan(
            text: '${receivedSubscriptions.name?[index].price} \$',
          ),
        ],
      ),
    );
  }
}
