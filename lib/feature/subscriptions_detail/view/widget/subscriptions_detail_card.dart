part of '../subscriptions_detail_view.dart';

/// SubscriptionCard
final class _SubscriptionsDetailCard extends StatelessWidget {
  /// Default constructor
  const _SubscriptionsDetailCard({
    required this.receivedSubscriptions,
    required this.index,
    required this.state,
    required this.scaffoldKey,
  });

  /// subscriptions
  final SubscriptionsList receivedSubscriptions;

  /// index
  final int index;

  /// state
  final Users state;

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    const elevation = 10.0;
    final appCubit = context.read<AppCubit>();
    return Padding(
      padding: const ProjectPadding.allSmall(),
      child: Card(
        elevation: elevation,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            /* Center(
              child: ClipRRect(
                borderRadius: context.border.normalBorderRadius,
                child: CustomCachedNetworkImage(
                  height: context.sized.dynamicHeight(0.1),
                  fit: BoxFit.fill,
                  width: context.sized.dynamicWidth(0.23),
                  imageUrl: receivedSubscriptions.subscriptionIcon.toString(),
                ),
              ),
            ),*/
            const Spacer(),
            _SubscriptionDetail(
              receivedSubscriptions: receivedSubscriptions,
              index: index,
            ),
            _SubscriptionsCardSwitch(
              scaffoldKey: scaffoldKey,
              state: state,
              receivedSubscriptions: receivedSubscriptions,
              index: index,
              subscriptionsDetailViewModel:
                  context.read<SubscriptionsDetailViewModel>(),
              appCubit: appCubit,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

final class _SubscriptionDetail extends StatelessWidget {
  const _SubscriptionDetail({
    required this.receivedSubscriptions,
    required this.index,
  });

  final SubscriptionsList receivedSubscriptions;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const ProjectPadding.onlyLeftSmall(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  receivedSubscriptions.name?[index].subscriptionPlan ?? '',
                  style: context.general.textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                _PriceTextRich(
                  receivedSubscriptions: receivedSubscriptions,
                  index: index,
                ),
              ],
            ),
          ),
        ),
      ],
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
            text: LocaleKeys.subscriptionDetails_price.tr(),
            style: context.general.textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          TextSpan(
            text: '${receivedSubscriptions.name?[index].price} \$',
            style: context.general.textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
