import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:subscriptionfairy/product/core/app_state.dart';
import 'package:subscriptionfairy/product/initialize/navigation/navigation_service.dart';
import 'package:subscriptionfairy/product/initialize/navigation/routes.dart';
import 'package:subscriptionfairy/product/model/subscription_list/subscriptions_list.dart';
import 'package:subscriptionfairy/product/utility/padding/project_padding.dart';
import 'package:subscriptionfairy/product/widget/custom_cached_network_image.dart';

part 'widget/search_subscriptions.dart';
part 'widget/subscription_view_app_bar.dart';
part 'widget/subscriptions_list_card.dart';

/// SubscriptionsView
final class SubscriptionsView extends StatelessWidget {
  /// Default constructor
  const SubscriptionsView({
    required this.state,
    super.key,
  });

  /// AppLoadedState
  final AppLoadedState state;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _SubscriptionViewAppBar(),
      body: _SubscriptionViewBuilder(
        state,
      ),
    );
  }
}

final class _SubscriptionViewBuilder extends StatelessWidget {
  const _SubscriptionViewBuilder(
    this.state,
  );
  final AppLoadedState state;

  @override
  Widget build(BuildContext context) {
    final subscriptions = state.subscriptions;

    return Padding(
      padding: const ProjectPadding.allSmall(),
      child: Column(
        children: [
          const _SearchSubscriptions(),
          context.sized.emptySizedHeightBoxLow3x,
          _SubscriptionsList(
            subscriptions: subscriptions,
            state: state,
          ),
        ],
      ),
    );
  }
}

final class _SubscriptionsList extends StatelessWidget {
  const _SubscriptionsList({
    required this.subscriptions,
    required this.state,
  });
  final List<SubscriptionsList> subscriptions;
  final AppLoadedState state;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: subscriptions.length,
        itemBuilder: (context, index) {
          final subscription = subscriptions[index];
          return _SubscriptionsListCard(
            subscription: subscription,
            index: index,
            state: state,
          );
        },
      ),
    );
  }
}
