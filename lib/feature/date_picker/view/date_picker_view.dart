import 'package:flutter/material.dart';
import 'package:subscriptionfairy/feature/subscriptions_detail/view_model/subscriptions_detail_view_model.dart';
import 'package:subscriptionfairy/product/initialize/navigation/navigation_service.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

/// DatePicker
final class DatePickerView extends StatelessWidget {
  /// DatePicker constructor
  const DatePickerView({super.key});

  @override
  Widget build(BuildContext context) {
    final receivedSelectDate = ModalRoute.of(context)!.settings.arguments!
        as SubscriptionsDetailViewModel;

    final controller = DateRangePickerController();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'DatePicker',
        ),
      ),
      body: SfDateRangePicker(
        selectionMode: DateRangePickerSelectionMode.range,
        showActionButtons: true,
        initialDisplayDate: DateTime.now(),
        showTodayButton: true,
        controller: controller,
        navigationDirection: DateRangePickerNavigationDirection.vertical,
        onSubmit: (value) {
          NavigationService.instance.navigateToBack();
        },
        onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
          _selectDate(
            args,
            receivedSelectDate,
            controller,
          );
        },
      ),
    );
  }

  void _selectDate(
    DateRangePickerSelectionChangedArgs args,
    SubscriptionsDetailViewModel receivedSelectDate,
    DateRangePickerController controller,
  ) {
    final startDate = args.value.startDate as DateTime;
    receivedSelectDate.onDateSelected(startDate);
    final endDate = startDate.add(
      Duration(
        days: receivedSelectDate.endDate
            .toInt(), // receivedSelectDate.endDate.toInt(),
      ),
    );

    controller.selectedRange = PickerDateRange(
      startDate,
      endDate,
    );
  }
}
