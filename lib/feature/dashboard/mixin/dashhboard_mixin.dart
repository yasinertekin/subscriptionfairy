import 'package:flutter/material.dart';
import 'package:subscriptionfairy/feature/dashboard/view/dashboard_view.dart';
import 'package:subscriptionfairy/product/utility/constants/enum/tab_views.dart';

/// DashBoardMixin
mixin DashBoardMixin on State<DashboardView> implements TickerProvider {
  late final TabController _tabController;

  /// tabController
  TabController get tabController => _tabController;

  /// tabViewsList
  late final List<Tab> _tabViewsList = TabViews.values.map(
    (e) {
      return Tab(
        icon: e.getIcon(),
      );
    },
  ).toList();

  /// tabViewsList
  List<Tab> get tabViews => _tabViewsList;

  @override
  void initState() {
    super.initState();
    _initTabController(TabViews.values.length, this);
  }

  @override
  void dispose() {
    _disposeTabController();
    super.dispose();
  }

  void _initTabController(int length, TickerProvider vsync) {
    _tabController = TabController(
      length: length,
      vsync: vsync,
    );
  }

  void _disposeTabController() {
    _tabController.dispose();
  }
}
