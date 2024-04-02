import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:subscriptionfairy/feature/subscriptions_detail/view_model/subscriptions_detail_view_model.dart';
import 'package:subscriptionfairy/product/core/app_cubit.dart';
import 'package:subscriptionfairy/product/core/app_state.dart';
import 'package:subscriptionfairy/product/initialize/language/locale_keys.g.dart';
import 'package:subscriptionfairy/product/initialize/navigation/navigation_service.dart';
import 'package:subscriptionfairy/product/initialize/navigation/routes.dart';
import 'package:subscriptionfairy/product/mixin/succesfull_lottie.dart';
import 'package:subscriptionfairy/product/model/subscription_list/subscriptions_list.dart';
import 'package:subscriptionfairy/product/model/users/users.dart';
import 'package:subscriptionfairy/product/utility/padding/project_padding.dart';

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
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: const _SubscriptionDetailAppBar(),
      body: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          childAspectRatio: context.sized.dynamicHeight(0.001),
        ),
        itemCount: receivedSubscriptions.name?.length,
        itemBuilder: (context, index) {
          return _SubscriptionsDetailCard(
            scaffoldKey: scaffoldKey,
            receivedSubscriptions: receivedSubscriptions,
            index: index,
            state: state.users,
          );
        },
      ),
    );
  }
}
