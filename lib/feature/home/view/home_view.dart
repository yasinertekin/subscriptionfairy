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
          StringConstants.mySubscriptions,
          style: context.general.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
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

final class _SubscriptionDetailsExpansionTile extends StatelessWidget {
  const _SubscriptionDetailsExpansionTile({
    required this.totalPrices,
    required this.state,
  });

  final num? totalPrices;
  final AppLoadedState state;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        'Subscription Details',
        style: context.general.textTheme.bodySmall?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      children: [
        _SubscriptionDetailsListTile(
          iconColor: ColorName.colorGreen,
          icon: const Icon(
            Icons.attach_money,
          ),
          title: 'Total Price',
          trailing: '${totalPrices?.toStringAsFixed(2)} TL',
        ),
        _SubscriptionDetailsListTile(
          iconColor: ColorName.colorGrey,
          icon: const Icon(
            Icons.subscriptions,
          ),
          title: 'Total Subscription',
          trailing: '${state.users.subscriptionList?.length}',
        ),
        _SubscriptionDetailsListTile(
          iconColor: ColorName.colorRed,
          icon: const Icon(
            Icons.subscriptions,
          ),
          title: 'Active Subscription',
          trailing: '${state.users.subscriptionList?.where(
                (element) => element.isSubscribed == true,
              ).length}',
        ),
      ],
    );
  }
}

final class _SubscriptionDetailsListTile extends StatelessWidget {
  const _SubscriptionDetailsListTile({
    required this.iconColor,
    required this.icon,
    required this.title,
    required this.trailing,
  });

  final Color iconColor;
  final Icon icon;
  final String title;
  final String trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon.icon,
        color: iconColor,
      ),
      title: Text(
        title,
        style: context.general.textTheme.bodySmall?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Text(
        trailing,
        style: context.general.textTheme.bodySmall?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
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
    final homeViewModel = HomeViewModel();
    final subscription = state.users.subscriptionList?[index];
    return ListenableBuilder(
      listenable: homeViewModel,
      builder: (context, child) => Column(
        children: [
          _changeDateWidget(context, homeViewModel, subscription),
          if (homeViewModel.isProcessing)
            const Align(
              alignment: Alignment.centerRight,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          else
            const SizedBox.shrink(),
        ],
      ),
    );
  }

  SizedBox _changeDateWidget(
    BuildContext context,
    HomeViewModel homeViewModel,
    Subscriptions? subscription,
  ) {
    return SizedBox(
      height: context.sized.dynamicHeight(0.53),
      width: context.sized.dynamicWidth(1),
      child: SfDateRangePicker(
        controller: controller,
        // ignore: avoid_bool_literals_in_conditional_expressions
        showActionButtons: homeViewModel.isProcessing ? false : true,
        initialSelectedDate: subscription?.startDate,
        selectionMode: DateRangePickerSelectionMode.range,
        initialDisplayDate: subscription?.startDate,
        initialSelectedRange: PickerDateRange(
          subscription?.startDate,
          subscription?.endDate,
        ),
        navigationDirection: DateRangePickerNavigationDirection.vertical,
        onSelectionChanged: (DateRangePickerSelectionChangedArgs args) async {
          _onSelectionChanged(args);
        },
        onCancel: () {
          NavigationService.instance.navigateToBack();
        },
        onSubmit: subscription?.startDate == null
            ? null
            : (Object? value) async {
                await _changeSubscriptionDate(
                  homeViewModel,
                  value,
                  context,
                );
              },
      ),
    );
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    // ignore: avoid_dynamic_calls
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
  }

  Future<void> _changeSubscriptionDate(
    HomeViewModel subscriptionNotifier,
    Object? value,
    BuildContext context,
  ) async {
    subscriptionNotifier.changeProcessing();
    final pickerDateRange = value! as PickerDateRange;
    final argsDate = pickerDateRange.startDate!;
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

    await context.read<AppCubit>().updateSubscriptions(
          state.users.subscriptionList![index],
          newSubscription,
        );
    await NavigationService.instance.navigateToBack();
    subscriptionNotifier.changeProcessing();
  }
}
