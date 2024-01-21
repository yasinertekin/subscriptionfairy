import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subscriptionfairy/feature/subscriptions_detail/subscriptions_detail_view_model.dart';
import 'package:subscriptionfairy/product/core/app_cubit.dart';
import 'package:subscriptionfairy/product/core/app_state.dart';
import 'package:subscriptionfairy/product/initialize/navigation/navigation_service.dart';
import 'package:subscriptionfairy/product/initialize/navigation/routes.dart';
import 'package:subscriptionfairy/product/mixin/succesfull_lottie.dart';
import 'package:subscriptionfairy/product/model/subscription_list/subscriptions_list.dart';
import 'package:subscriptionfairy/product/widget/custom_cached_network_image.dart';

/// SubscriptionDetails
final class SubscriptionDetails extends StatelessWidget with SuccesFullLottie {
  /// Default constructor
  const SubscriptionDetails({
    super.key,
  });

  /// subscriptions

  @override
  Widget build(BuildContext context) {
    // arguments'ten geçilen verileri al
    final receivedSubscriptions =
        ModalRoute.of(context)!.settings.arguments! as SubscriptionsList;
    final state = context.watch<AppCubit>().state as AppLoadedState;
    final subscriptionsDetailViewModel = SubscriptionsDetailViewModel();
    final appCubit = context.read<AppCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Subscription Details'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: receivedSubscriptions.name?.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [
                const Spacer(),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CustomCachedNetworkImage(
                    height: 100,
                    width: 100,
                    imageUrl: receivedSubscriptions.subscriptionIcon.toString(),
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            receivedSubscriptions.name?[index].subscriptionPlan
                                    .toString() ??
                                '',
                          ),
                          const Text('15TL'),
                        ],
                      ),
                    ),
                    ListenableBuilder(
                      listenable: subscriptionsDetailViewModel,
                      builder: (context, child) => Switch(
                        value: state.users.subscriptionList!
                            .where(
                              (element) =>
                                  element.subId ==
                                      receivedSubscriptions
                                          .name?[index].subId &&
                                  element.isSubscribed == true,
                            )
                            .isNotEmpty,
                        onChanged: (value) async {
                          subscriptionsDetailViewModel.onEndDateSelected(
                            receivedSubscriptions
                                .name![index].subscriptionLength!,
                          );
                          await _subscriptionsOperation(
                            value,
                            subscriptionsDetailViewModel,
                            appCubit,
                            receivedSubscriptions,
                            index,
                            context,
                            state,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> _subscriptionsOperation(
    bool value,
    SubscriptionsDetailViewModel subscriptionsDetailViewModel,
    AppCubit appCubit,
    SubscriptionsList receivedSubscriptions,
    int index,
    BuildContext context,
    AppLoadedState state,
  ) async {
    if (value) {
      await NavigationService.instance.navigateToPage(
        path: Routes.datePicker,
        data: subscriptionsDetailViewModel,
      );

      await _updateSubscriptionList(
        appCubit,
        receivedSubscriptions,
        index,
        subscriptionsDetailViewModel,
      );
      succesFullLottie(
        context,
      );
    } else {
      await _deleteSubscriptions(
        context,
        state,
        receivedSubscriptions,
        index,
      );
    }
  }

  Future<void> _deleteSubscriptions(
    BuildContext context,
    AppLoadedState state,
    SubscriptionsList receivedSubscriptions,
    int index,
  ) async {
    await context.read<AppCubit>().deleteSubscriptionList(
          state.users.subscriptionList!.firstWhere(
            (element) =>
                element.subId == receivedSubscriptions.name![index].subId,
          ),
        );
  }

  Future<void> _updateSubscriptionList(
    AppCubit appCubit,
    SubscriptionsList receivedSubscriptions,
    int index,
    SubscriptionsDetailViewModel subscriptionsDetailViewModel,
  ) async {
    await appCubit.updateSubscriptionList(
      receivedSubscriptions.name![index].copyWith(
        isSubscribed: true,
        startDate: subscriptionsDetailViewModel.selectedDate,
        endDate: subscriptionsDetailViewModel.selectedDate.add(
          Duration(
            days:
                receivedSubscriptions.name![index].subscriptionLength!.toInt(),
          ),
        ),
      ),
    );
  }
}
