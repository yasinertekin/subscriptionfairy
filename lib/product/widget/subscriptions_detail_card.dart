import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subscriptionfairy/feature/subscriptions_detail/view_model/subscriptions_detail_view_model.dart';
import 'package:subscriptionfairy/product/core/app_cubit.dart';
import 'package:subscriptionfairy/product/core/app_state.dart';
import 'package:subscriptionfairy/product/initialize/navigation/navigation_service.dart';
import 'package:subscriptionfairy/product/initialize/navigation/routes.dart';
import 'package:subscriptionfairy/product/model/subscriptions/subscriptions.dart';
import 'package:subscriptionfairy/product/widget/custom_cached_network_image.dart';

/// SubscriptionCard
final class SubscriptionDetailCard extends StatelessWidget {
  /// Default constructor
  const SubscriptionDetailCard({
    required this.receivedSubscriptions,
    required this.index,
    required this.state,
    super.key,
  });

  /// subscriptions
  final Subscriptions receivedSubscriptions;

  /// index
  final int index;

  /// state
  final AppLoadedState state;

  @override
  Widget build(BuildContext context) {
    final subscriptionsDetailViewModel =
        context.watch<SubscriptionsDetailViewModel>();

    return Card(
      child: ListTile(
        leading: CustomCachedNetworkImage(
          height: 100,
          width: 100,
          imageUrl: state.subscriptions[index].subscriptionIcon.toString(),
        ),
        title: Text(
          state.subscriptions[index].name?.first.subscriptionPlan ?? '',
        ),
        trailing: _SubscriptionDetailCardSwitch(
          state: state,
          receivedSubscriptions: receivedSubscriptions,
          subscriptionsDetailViewModel: subscriptionsDetailViewModel,
        ),
      ),
    );
  }
}

final class _SubscriptionDetailCardSwitch extends StatelessWidget {
  const _SubscriptionDetailCardSwitch({
    required this.state,
    required this.receivedSubscriptions,
    required this.subscriptionsDetailViewModel,
  });

  final AppLoadedState state;
  final Subscriptions receivedSubscriptions;
  final SubscriptionsDetailViewModel subscriptionsDetailViewModel;

  @override
  Widget build(BuildContext context) {
    final appCubit = context.read<AppCubit>();
    return Switch(
      value: state.users.subscriptionList!
          .where(
            (element) =>
                element.subId == receivedSubscriptions.subId &&
                // ignore: use_if_null_to_convert_nulls_to_bools
                element.isSubscribed == true,
          )
          .isNotEmpty,
      onChanged: (value) async {
        context.read<SubscriptionsDetailViewModel>().onEndDateSelected(
              receivedSubscriptions.subscriptionLength!,
            );

        if (value) {
          await NavigationService.instance.navigateToPage(
            path: Routes.datePicker,
            data: subscriptionsDetailViewModel,
          );
          await appCubit.updateSubscriptionList(
            receivedSubscriptions.copyWith(
              isSubscribed: true,
              startDate: subscriptionsDetailViewModel.selectedDate,
              endDate: subscriptionsDetailViewModel.selectedDate.add(
                Duration(
                  days: receivedSubscriptions.subscriptionLength!.toInt(),
                ),
              ),
            ),
          );
        } else {
          await context.read<AppCubit>().deleteSubscriptionList(
                state.users.subscriptionList!.firstWhere(
                  (element) =>
                      element.subId == receivedSubscriptions.subId &&
                      // ignore: use_if_null_to_convert_nulls_to_bools
                      element.isSubscribed == true,
                ),
              );
        }
      },
    );
  }
}
