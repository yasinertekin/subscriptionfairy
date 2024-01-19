import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

/// DatePicker
final class DatePicker extends StatefulWidget {
  /// DatePicker constructor
  const DatePicker({super.key});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  @override
  Widget build(BuildContext context) {
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
