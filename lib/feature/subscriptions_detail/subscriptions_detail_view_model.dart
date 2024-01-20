import 'package:flutter/material.dart';

final class SubscriptionsDetailViewModel extends ChangeNotifier {
  DateTime selectedDate = DateTime.now();

  void onDateSelected(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }
}
