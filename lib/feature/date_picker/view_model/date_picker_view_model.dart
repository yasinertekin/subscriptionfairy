import 'package:flutter/material.dart';

/// DatePickerViewModel
final class DatePickerViewModel extends ChangeNotifier {
  /// DatePickerViewModel constructor
  DatePickerViewModel();

  DateTime _startDate = DateTime.now().subtract(
    const Duration(days: 30),
  );

  /// startDate
  DateTime get startDate => _startDate;
  set startDate(DateTime value) {
    _startDate = value;
    notifyListeners();
  }

  DateTime _endDate = DateTime.now().add(
    const Duration(days: 2),
  );

  /// endDate
  DateTime get endDate => _endDate;
  set endDate(DateTime value) {
    _endDate = value;
    notifyListeners();
  }
}
