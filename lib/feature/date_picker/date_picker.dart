import 'package:flutter/material.dart';
import 'package:subscriptionfairy/feature/subscriptions_detail/subscriptions_detail_view_model.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

/// DatePicker
final class DatePicker extends StatelessWidget {
  /// DatePicker constructor
  const DatePicker({super.key});

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
          Navigator.pop(context, value);
        },
        onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
          final startDate = args.value.startDate as DateTime;
          receivedSelectDate.onDateSelected(startDate);
          final endDate = startDate.add(const Duration(days: 30));

          controller.selectedRange = PickerDateRange(
            startDate,
            endDate,
          );
        },
      ),
    );
  }
}
