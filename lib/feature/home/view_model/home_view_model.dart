import 'package:flutter/material.dart';

/// This is the view model for the home feature.
final class HomeViewModel extends ChangeNotifier {
  bool _isProcessing = false;

  /// This is the getter for the isProcessing variable.
  bool get isProcessing => _isProcessing;

  /// changeProcessing is a function that changes the value of isProcessing.
  void changeProcessing() {
    _isProcessing = !_isProcessing;
    notifyListeners();
  }
}
