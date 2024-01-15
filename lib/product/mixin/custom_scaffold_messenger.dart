import 'package:flutter/material.dart';

/// This is the mixin for the custom scaffold messenger.
mixin CustomScaffoldMessenger {
  /// This method shows the snack bar.
  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
