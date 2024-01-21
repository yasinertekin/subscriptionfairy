import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kartal/kartal.dart';
import 'package:subscriptionfairy/feature/home/view/home_view.dart';
import 'package:subscriptionfairy/feature/home/view/widget/home_subscription_card.dart';
import 'package:subscriptionfairy/feature/home/view_model/home_view_model.dart';
import 'package:subscriptionfairy/product/model/subscriptions/subscriptions.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

/// This is the mixin for the home subscription card.
mixin HomeSubscriptionCardMixin on State<HomeSubscriptionCard> {
  final _controller = DateRangePickerController();

  /// This is the state for the home view.
  DateRangePickerController get controller => _controller;

  /// This is the state for the home view.
  final _homeViewModel = HomeViewModel();

  /// This is the state for the home view.
  HomeViewModel get homeViewModel => _homeViewModel;

  /// This is the state for the home view.
  String getFormattedDate(DateTime? date) {
    return DateFormat.yMMMd().format(date ?? DateTime.now());
  }

  /// This is the state for the home view.
  DateTime? getSubscriptionStartDate() {
    return widget.state.users.subscriptionList?[widget.index].startDate;
  }

  /// This is the state for the home view.
  DateTime? getSubscriptionEndDate() {
    return widget.state.users.subscriptionList?[widget.index].endDate;
  }

  /// This is the state for the home view.
  Subscriptions? getSubscriptionList() {
    return widget.state.users.subscriptionList?[widget.index];
  }

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
