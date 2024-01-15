import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/src/index.dart';
import 'package:kartal/kartal.dart';
import 'package:subscriptionfairy/feature/subscriptions/view_model/subscriptions_cubit.dart';
import 'package:subscriptionfairy/feature/subscriptions/view_model/subscriptions_state.dart';
import 'package:subscriptionfairy/product/model/subscriptions.dart';

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
          return _SubscriptionsListView(
            subscriptions: state.subscriptions,
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

final class _SubscriptionsListView extends StatelessWidget {
  const _SubscriptionsListView({
    required this.subscriptions,
  });
  final List<Subscriptions> subscriptions;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: subscriptions.length,
      itemBuilder: (context, index) {
        final subscription = subscriptions[index];
        return _SubscriptionsCard(
          subscriptions: subscription,
        );
      },
    );
  }
}

final class _SubscriptionsCard extends StatelessWidget {
  const _SubscriptionsCard({
    required this.subscriptions,
  });

  final Subscriptions subscriptions;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorName.colorRed,
      elevation: 8,
      child: ListTile(
        title: Text(
          subscriptions.name.toString(),
          style: context.general.textTheme.titleLarge!.copyWith(
            color: ColorName.colorWhite,
          ),
        ),
        subtitle: Text(
          subscriptions.title.toString(),
          style: context.general.textTheme.bodyLarge!.copyWith(
            color: ColorName.colorWhite,
          ),
        ),
      ),
    );
  }
}
