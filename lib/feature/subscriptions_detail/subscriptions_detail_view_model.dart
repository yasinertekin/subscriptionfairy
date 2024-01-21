import 'package:flutter/material.dart';

final class SubscriptionsDetailViewModel extends ChangeNotifier {
  SubscriptionsDetailViewModel();
  DateTime selectedDate = DateTime.now();

  double endDate = 0;

  void onDateSelected(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }

  void onEndDateSelected(double date) {
    endDate = date;
    notifyListeners();
  }
}
