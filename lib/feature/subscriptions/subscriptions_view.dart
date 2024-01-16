import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:subscriptionfairy/feature/subscriptions/view_model/subscriptions_cubit.dart';
import 'package:subscriptionfairy/feature/subscriptions/view_model/subscriptions_state.dart';
import 'package:subscriptionfairy/product/initialize/navigation/navigation_service.dart';
import 'package:subscriptionfairy/product/initialize/navigation/routes.dart';
import 'package:subscriptionfairy/product/model/subscription_list/subscriptions_list.dart';
import 'package:subscriptionfairy/product/utility/padding/project_padding.dart';
import 'package:subscriptionfairy/product/widget/custom_cached_network_image.dart';

/// SubscriptionsView
final class SubscriptionsView extends StatelessWidget {
  /// Default constructor
  const SubscriptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: _SubscriptionViewAppBar(),
      body: _SubscriptionViewBlocBuilder(),
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
  const _SubscriptionViewBlocBuilder();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubscriptionsCubit, SubscriptionsState>(
      builder: (context, state) {
        if (state is SubscriptionsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is SubscriptionsLoaded) {
          final subscriptions = state.subscriptions;
          return Padding(
            padding: const ProjectPadding.allSmall(),
            child: Column(
              children: [
                const _SearchSubscriptions(),
                context.sized.emptySizedHeightBoxLow3x,
                _SubscriptionsList(
                  subscriptions: subscriptions,
                ),
              ],
            ),
          );
        } else if (state is SubscriptionsError) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else {
          return const Center(
            child: Text('Something went wrong!'),
          );
        }
      },
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
  });
  final List<SubscriptionsList> subscriptions;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: subscriptions.length,
        itemBuilder: (context, index) {
          final subscription = subscriptions[index];
          return _SubscriptionsListCard(
            subscription: subscription,
          );
        },
      ),
    );
  }
}

final class _SubscriptionsListCard extends StatelessWidget {
  const _SubscriptionsListCard({
    required this.subscription,
  });

  final SubscriptionsList subscription;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(CupertinoIcons.chevron_right),
        ),
        onTap: () {
          NavigationService.instance.navigateToPage(
            path: Routes.subscriptionsDetail,
            data: subscription,
          );
        },
        leading: ClipRRect(
          borderRadius: context.border.normalBorderRadius,
          child: CustomCachedNetworkImage(
            height: context.sized.dynamicHeight(0.15),
            width: context.sized.dynamicWidth(0.15),
            imageUrl: subscription.subscriptionIcon ?? '',
          ),
        ),
        title: Text(
          subscription.subscriptionName ?? '',
          style: context.general.textTheme.titleLarge?.copyWith(),
        ),
      ),
    );
  }
}
