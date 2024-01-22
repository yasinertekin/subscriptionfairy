import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:subscriptionfairy/feature/subscriptions_detail/view_model/subscriptions_detail_view_model.dart';
import 'package:subscriptionfairy/product/constants/string_constants.dart';
import 'package:subscriptionfairy/product/core/app_cubit.dart';
import 'package:subscriptionfairy/product/core/app_state.dart';
import 'package:subscriptionfairy/product/initialize/navigation/navigation_service.dart';
import 'package:subscriptionfairy/product/initialize/navigation/routes.dart';
import 'package:subscriptionfairy/product/mixin/succesfull_lottie.dart';
import 'package:subscriptionfairy/product/model/subscription_list/subscriptions_list.dart';
import 'package:subscriptionfairy/product/utility/padding/project_padding.dart';
import 'package:subscriptionfairy/product/widget/custom_cached_network_image.dart';

part 'widget/subscription_detail_app_bar.dart';
part 'widget/subscriptions_card_switch.dart';
part 'widget/subscriptions_detail_card.dart';

/// SubscriptionDetails
final class SubscriptionDetailView extends StatelessWidget
    with SuccesFullLottie {
  /// Default constructor
  const SubscriptionDetailView({
    super.key,
  });

  /// subscriptions

  @override
  Widget build(BuildContext context) {
    // arguments'ten geçilen verileri al
    final receivedSubscriptions =
        ModalRoute.of(context)!.settings.arguments! as SubscriptionsList;
    final state = context.watch<AppCubit>().state as AppLoadedState;
    const crossAxisCount = 2;
    return Scaffold(
      appBar: const _SubscriptionDetailAppBar(),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
        ),
        itemCount: receivedSubscriptions.name?.length,
        itemBuilder: (context, index) {
          return _SubscriptionsDetailCard(
            receivedSubscriptions: receivedSubscriptions,
            index: index,
            state: state,
          );
        },
      ),
    );
  }
}
