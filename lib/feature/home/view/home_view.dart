import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:subscriptionfairy/feature/home/view/widget/home_subscription_card.dart';
import 'package:subscriptionfairy/product/core/app_cubit.dart';
import 'package:subscriptionfairy/product/core/app_state.dart';
import 'package:subscriptionfairy/product/initialize/navigation/navigation_service.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

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
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'My Subscriptions',
          style: context.general.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: _HomeBlocBuilder(
        state,
      ),
    );
  }
}

final class _HomeBlocBuilder extends StatelessWidget {
  const _HomeBlocBuilder(
    this.state,
  );

  final AppLoadedState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: state.users.subscriptionList?.length,
            itemBuilder: (context, index) {
              return HomeSubscriptionCard(
                state: state,
                index: index,
              );
            },
          ),
        ),
      ],
    );
  }
}

/// This is the view for the home date range picker.
final class HomeDateRangePicker extends StatelessWidget {
  /// This is the constructor for the home date range picker.
  const HomeDateRangePicker({
    required this.controller,
    required this.state,
    required this.index,
    super.key,
  });

  /// This is the controller for the home date range picker.
  final DateRangePickerController controller;

  /// This is the state for the home date range picker.
  final AppLoadedState state;

  /// This is the index for the home date range picker.
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.sized.dynamicHeight(0.6),
      width: context.sized.dynamicWidth(1),
      child: SfDateRangePicker(
        controller: controller,
        showActionButtons: true,
        initialSelectedDate: state.users.subscriptionList?[index].startDate,
        selectionMode: DateRangePickerSelectionMode.range,
        initialDisplayDate: state.users.subscriptionList?[index].startDate,
        initialSelectedRange: PickerDateRange(
          state.users.subscriptionList?[index].startDate,
          state.users.subscriptionList?[index].endDate,
        ),
        navigationDirection: DateRangePickerNavigationDirection.vertical,
        onSelectionChanged: (DateRangePickerSelectionChangedArgs args) async {
          final argsDate = args.value.startDate as DateTime;
          final newSubscription = state.users.subscriptionList![index].copyWith(
            startDate: argsDate,
            endDate: argsDate.add(
              Duration(
                days: state.users.subscriptionList![index].subscriptionLength
                        ?.toInt() ??
                    0,
              ),
            ),
          );
          controller.selectedRange = PickerDateRange(
            newSubscription.startDate,
            newSubscription.endDate,
          );
        },
        onCancel: () {
          Navigator.pop(context);
        },
        onSubmit: state.users.subscriptionList?[index].startDate == null
            ? null
            : (Object? value) async {
                final pickerDateRange = value! as PickerDateRange;
                final argsDate = pickerDateRange.startDate!;
                final newSubscription =
                    state.users.subscriptionList![index].copyWith(
                  startDate: argsDate,
                  endDate: argsDate.add(
                    Duration(
                      days: state
                              .users.subscriptionList![index].subscriptionLength
                              ?.toInt() ??
                          0,
                    ),
                  ),
                );
                controller.selectedRange = PickerDateRange(
                  newSubscription.startDate,
                  newSubscription.endDate,
                );

                await context.read<AppCubit>().updateSubscriptions(
                      state.users.subscriptionList![index],
                      newSubscription,
                    );
                await NavigationService.instance.navigateToBack();
              },
      ),
    );
  }
}
