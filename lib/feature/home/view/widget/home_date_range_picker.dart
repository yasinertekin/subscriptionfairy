part of '../home_view.dart';

/// This is the view for the home date range picker.
final class HomeDateRangePicker extends StatelessWidget {
  /// This is the constructor for the home date range picker.
  const HomeDateRangePicker({
    required this.controller,
    required this.subscription,
    required this.index,
    super.key,
  });

  /// This is the controller for the home date range picker.
  final DateRangePickerController controller;

  /// This is the state for the home date range picker.
  final Subscriptions? subscription;

  /// This is the index for the home date range picker.
  final int index;

  @override
  Widget build(BuildContext context) {
    final homeViewModel = HomeViewModel();

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
          final argsDate = args.value.startDate as DateTime;
          final newSubscription = subscription?.copyWith(
            startDate: argsDate,
            endDate: argsDate.add(
              Duration(
                days: subscription.subscriptionLength?.toInt() ?? 0,
              ),
            ),
          );
          controller.selectedRange = PickerDateRange(
            newSubscription?.startDate,
            newSubscription?.endDate,
          );
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
  }

  Future<void> _changeSubscriptionDate(
    HomeViewModel subscriptionNotifier,
    Object? value,
    BuildContext context,
  ) async {
    subscriptionNotifier.changeProcessing();
    final pickerDateRange = value! as PickerDateRange;
    final argsDate = pickerDateRange.startDate!;
    final newSubscription = subscription?.copyWith(
      startDate: argsDate,
      endDate: argsDate.add(
        Duration(
          days: subscription?.subscriptionLength?.toInt() ?? 0,
        ),
      ),
    );
    controller.selectedRange = PickerDateRange(
      newSubscription?.startDate,
      newSubscription?.endDate,
    );

    await context.read<AppCubit>().updateSubscriptions(
          subscription!,
          newSubscription!,
        );
    await NavigationService.instance.navigateToBack();
    subscriptionNotifier.changeProcessing();
  }
}
