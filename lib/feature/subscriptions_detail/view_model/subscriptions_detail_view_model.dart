import 'package:flutter/material.dart';

/// SubscriptionsDetailViewModel
final class SubscriptionsDetailViewModel extends ChangeNotifier {
  /// SubscriptionsDetailViewModel constructor
  SubscriptionsDetailViewModel();

  /// selectedDate
  DateTime selectedDate = DateTime.now();

  /// endDate
  double endDate = 0;

  /// onDateSelected
  void onDateSelected(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }

  /// onEndDateSelected
  void onEndDateSelected(double date) {
    endDate = date;
    notifyListeners();
  }
}
