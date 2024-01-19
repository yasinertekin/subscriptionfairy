import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:subscriptionfairy/product/core/app_state.dart';
import 'package:subscriptionfairy/product/initialize/navigation/navigation_service.dart';
import 'package:subscriptionfairy/product/initialize/navigation/routes.dart';
import 'package:subscriptionfairy/product/model/subscription_list/subscriptions_list.dart';
import 'package:subscriptionfairy/product/utility/padding/project_padding.dart';
import 'package:subscriptionfairy/product/widget/custom_cached_network_image.dart';

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
      body: _SubscriptionViewBlocBuilder(
        state,
      ),
    );
  }
}

final class _SubscriptionViewAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _SubscriptionViewAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Subscriptions'),
      centerTitle: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

final class _SubscriptionViewBlocBuilder extends StatelessWidget {
  const _SubscriptionViewBlocBuilder(
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

final class _SearchSubscriptions extends StatelessWidget {
  const _SearchSubscriptions();

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      decoration: InputDecoration(
        hintText: 'Search',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: context.border.normalBorderRadius,
        ),
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

final class _SubscriptionsListCard extends StatelessWidget {
  const _SubscriptionsListCard({
    required this.subscription,
    required this.state,
    required this.index,
  });

  final SubscriptionsList subscription;
  final AppLoadedState state;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const ProjectPadding.allSmall(),
      child: Card(
        child: ListTile(
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.chevron_right,
            ),
          ),
          onTap: () {
            NavigationService.instance.navigateToPage(
              path: Routes.subscriptionsDetail,
              data: state.subscriptions[index],
            );
          },
          leading: ClipRRect(
            borderRadius: context.border.normalBorderRadius,
            child: CustomCachedNetworkImage(
              height: context.sized.dynamicHeight(0.12),
              width: context.sized.dynamicWidth(0.25),
              imageUrl: subscription.subscriptionIcon ?? '',
            ),
          ),
          title: Text(
            subscription.subscriptionName ?? '',
            style: context.general.textTheme.titleLarge?.copyWith(),
          ),
        ),
      ),
    );
  }
}
