import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

final class DatePicker extends StatelessWidget {
  const DatePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'DatePicker',
        ),
      ),
      body: SfDateRangePicker(
        selectionMode: DateRangePickerSelectionMode.range,
        initialSelectedRange: PickerDateRange(
          DateTime.now().subtract(
            const Duration(days: 4),
          ),
          DateTime.now().add(
            const Duration(days: 3),
          ),
        ),
      ),
    );
  }
}
