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
import 'package:subscriptionfairy/product/widget/other/common_bloc_builder.dart';

part 'widget/search_subscriptions.dart';
part 'widget/subscription_view_app_bar.dart';

/// SubscriptionsView
final class SubscriptionsView extends StatelessWidget {
  /// Default constructor
  const SubscriptionsView({
    super.key,
  });

  /// AppLoadedState
  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<ScaffoldState>();
    return CommonBlocBuilder(
      key: key,
      builder: (context, state) {
        final subscriptionsList = (state as AppLoadedState).subscriptions;
        return Scaffold(
          appBar: const _SubscriptionViewAppBar(),
          body: _SubscriptionViewBuilder(
            subscriptionsList,
          ),
        );
      },
    );
  }
}

final class _SubscriptionViewBuilder extends StatelessWidget {
  const _SubscriptionViewBuilder(
    this.subscriptionsList,
  );

  final List<SubscriptionsList> subscriptionsList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const ProjectPadding.allSmall(),
      child: Column(
        children: [
          _SearchSubscriptions(
            subscriptionsList,
          ),
          context.sized.emptySizedHeightBoxLow3x,
          _SubscriptionsList(
            subscriptions: subscriptionsList,
          ),
        ],
      ),
    );
  }
}

final class _SubscriptionsList extends StatelessWidget {
  const _SubscriptionsList({
    required this.subscriptions,
  });
  final List<SubscriptionsList> subscriptions;

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
          );
        },
      ),
    );
  }
}
