import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:subscriptionfairy/feature/dashboard/mixin/dashhboard_mixin.dart';
import 'package:subscriptionfairy/feature/home/view/home_view.dart';
import 'package:subscriptionfairy/feature/profile/view/profile_view.dart';
import 'package:subscriptionfairy/feature/subscriptions/view/subscriptions_view.dart';
import 'package:subscriptionfairy/product/utility/enum/tab_views.dart';

/// DashboardView
final class DashboardView extends StatefulWidget {
  /// DashboardView
  const DashboardView({super.key});
  @override
  State<DashboardView> createState() => _DashboardViewState();
}

final class _DashboardViewState extends State<DashboardView>
    with DashBoardMixin {
  @override
  Widget build(BuildContext context) {
    return _DashBoard(
      tabController: tabController,
      tabViews: tabViews,
    );
  }

  @override
  Ticker createTicker(TickerCallback onTick) {
    return Ticker(onTick);
  }
}

final class _DashBoard extends StatelessWidget {
  const _DashBoard({
    required this.tabController,
    required this.tabViews,
  });

  final TabController tabController;
  final List<Tab> tabViews;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: TabViews.values.length,
      child: _DashboardBody(
        tabController: tabController,
        tabViews: tabViews,
      ),
    );
  }
}

final class _DashboardBody extends StatelessWidget {
  const _DashboardBody({
    required this.tabController,
    required this.tabViews,
  });

  final TabController tabController;
  final List<Tab> tabViews;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _BottomAppBar(
        tabController: tabController,
        tabViewsList: tabViews,
      ),
      body: _DashboardView(
        tabController: tabController,
      ),
    );
  }
}

final class _DashboardView extends StatelessWidget {
  const _DashboardView({
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      controller: _tabController,
      children: const [
        HomeView(),
        SubscriptionsView(),
        ProfileView(),
      ],
    );
  }
}

final class _BottomAppBar extends StatelessWidget {
  const _BottomAppBar({
    required this.tabController,
    required this.tabViewsList,
  });

  final TabController tabController;
  final List<Tab> tabViewsList;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: TabBar(
        onTap: tabController.animateTo,
        controller: tabController,
        tabs: tabViewsList,
      ),
    );
  }
}
