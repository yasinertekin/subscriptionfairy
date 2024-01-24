import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:subscriptionfairy/product/core/app_state.dart';
import 'package:subscriptionfairy/product/initialize/language/locale_keys.g.dart';
import 'package:subscriptionfairy/product/initialize/navigation/navigation_service.dart';
import 'package:subscriptionfairy/product/initialize/navigation/routes.dart';
import 'package:subscriptionfairy/product/model/subscription_list/subscriptions_list.dart';
import 'package:subscriptionfairy/product/utility/padding/project_padding.dart';
import 'package:subscriptionfairy/product/widget/card/subscriptions_list_card.dart';

part 'widget/search_subscriptions.dart';
part 'widget/subscription_view_app_bar.dart';

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
        state.subscriptions.first,
      ),
    );
  }
}

final class _SubscriptionViewBuilder extends StatelessWidget {
  const _SubscriptionViewBuilder(
    this.state,
    this.subscriptionsList,
  );
  final AppLoadedState state;
  final SubscriptionsList subscriptionsList;

  @override
  Widget build(BuildContext context) {
    final subscriptions = state.subscriptions;

    return Padding(
      padding: const ProjectPadding.allSmall(),
      child: Column(
        children: [
          _SearchSubscriptions(
            subscriptionsList,
          ),
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
          return SubscriptionsListCard(
            subscription: subscription,
            index: index,
            state: state,
          );
        },
      ),
    );
  }
}
