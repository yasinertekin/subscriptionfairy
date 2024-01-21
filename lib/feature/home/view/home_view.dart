import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/src/index.dart';
import 'package:kartal/kartal.dart';
import 'package:subscriptionfairy/feature/home/view/widget/home_subscription_card.dart';
import 'package:subscriptionfairy/feature/home/view_model/home_view_model.dart';
import 'package:subscriptionfairy/product/constants/string_constants.dart';
import 'package:subscriptionfairy/product/core/app_cubit.dart';
import 'package:subscriptionfairy/product/core/app_state.dart';
import 'package:subscriptionfairy/product/initialize/navigation/navigation_service.dart';
import 'package:subscriptionfairy/product/model/subscriptions/subscriptions.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

part 'widget/home_app_bar.dart';
part 'widget/home_date_range_picker.dart';
part 'widget/subscription_detail_expansion_tile.dart';
part 'widget/subscription_details_list_tile.dart';

/// This is the view for the home feature.
final class HomeView extends StatelessWidget {
  /// This is the constructor for the home view.
  const HomeView({
    required this.state,
    required this.appcubit,
    super.key,
  });

  /// This is the state for the home view.
  final AppLoadedState state;

  /// This is the cubit for the home view.
  final AppCubit appcubit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _HomeAppBar(),
      body: _HomeBuilder(
        state,
      ),
    );
  }
}

final class _HomeBuilder extends StatelessWidget {
  const _HomeBuilder(
    this.state,
  );

  final AppLoadedState state;

  @override
  Widget build(BuildContext context) {
    final totalPrices = state.users.subscriptionList
        ?.map((e) => e.price)
        .fold<num>(0, (value, element) => value + (element ?? 0));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SubscriptionDetailsExpansionTile(
          totalPrices: totalPrices,
          state: state,
        ),
        _SubscriptionList(
          state: state,
        ),
      ],
    );
  }
}

final class _SubscriptionList extends StatelessWidget {
  const _SubscriptionList({
    required this.state,
  });

  final AppLoadedState state;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: state.users.subscriptionList?.length,
        itemBuilder: (context, index) {
          return HomeSubscriptionCard(
            state: state,
            index: index,
          );
        },
      ),
    );
  }
}
