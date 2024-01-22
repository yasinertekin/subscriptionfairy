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
    final appCubit = context.read<AppCubit>();
    return Padding(
      padding: const ProjectPadding.allSmall(),
      child: Card(
        elevation: 10,
        child: Column(
          children: [
            const Spacer(),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CustomCachedNetworkImage(
                height: 100,
                width: 100,
                imageUrl: receivedSubscriptions.subscriptionIcon.toString(),
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          receivedSubscriptions.name?[index].subscriptionPlan
                                  .toString() ??
                              '',
                          style: context.general.textTheme.titleMedium,
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Price: ',
                                style: context.general.textTheme.titleMedium,
                              ),
                              TextSpan(
                                text:
                                    '${receivedSubscriptions.name?[index].price} \$',
                              ),
                            ],
                          ),
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
