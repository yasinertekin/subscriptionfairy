import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:subscriptionfairy/feature/home/view/home_view.dart';
import 'package:subscriptionfairy/feature/home/view/widget/home_subscription_card.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

/// This is the mixin for the home subscription card.
mixin HomeSubscriptionCardMixin on State<HomeSubscriptionCard> {
  final _controller = DateRangePickerController();

  /// This is the state for the home view.
  DateRangePickerController get controller => _controller;

  /// Alert Dialog
  void showCustomDatePicker(
    BuildContext context,
    DateRangePickerController controller,
  ) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Tarih Seç',
          ),
          content: SizedBox(
            height: context.sized.dynamicHeight(0.6),
            width: context.sized.dynamicWidth(1),
            child: HomeDateRangePicker(
              controller: controller,
              state: widget.state,
              index: widget.index,
            ),
          ),
        );
      },
    );
  }
}
