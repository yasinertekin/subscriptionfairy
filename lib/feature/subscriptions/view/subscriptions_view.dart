import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:subscriptionfairy/product/core/app_cubit.dart';
import 'package:subscriptionfairy/product/core/app_state.dart';
import 'package:subscriptionfairy/product/initialize/language/locale_keys.g.dart';
import 'package:subscriptionfairy/product/initialize/navigation/navigation_service.dart';
import 'package:subscriptionfairy/product/initialize/navigation/routes.dart';
import 'package:subscriptionfairy/product/model/subscription_list/subscriptions_list.dart';
import 'package:subscriptionfairy/product/utility/padding/project_padding.dart';
import 'package:subscriptionfairy/product/widget/card/subscriptions_list_card.dart';
import 'package:subscriptionfairy/product/widget/custom_loading.dart';

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
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        if (state is AppLoadingState) {
          return const CustomLoading();
        } else if (state is AppLoadedState) {
          return Scaffold(
            appBar: const _SubscriptionViewAppBar(),
            body: _SubscriptionViewBuilder(
              state.subscriptions,
              state.subscriptions.first,
            ),
          );
        } else if (state is AppErrorState) {
          return Center(
            child: Text(state.error),
          );
        } else {
          return Center(
            child: const Text(LocaleKeys.dashboard_unknownState).tr(),
          );
        }
      },
    );
  }
}

final class _SubscriptionViewBuilder extends StatelessWidget {
  const _SubscriptionViewBuilder(
    this.subscriptionsList,
    this.subscriptionListTwo,
  );

  final List<SubscriptionsList> subscriptionsList;
  final SubscriptionsList subscriptionListTwo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const ProjectPadding.allSmall(),
      child: Column(
        children: [
          _SearchSubscriptions(
            subscriptionListTwo,
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
