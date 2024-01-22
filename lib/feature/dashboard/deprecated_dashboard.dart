/*import 'package:flutter/material.dart';
import 'package:subscriptionfairy/feature/dashboard/dashboard_view.dart';

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
*/

/*import 'package:flutter/material.dart';

import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subscriptionfairy/feature/dashboard/dashboard_mixin.dart';
import 'package:subscriptionfairy/feature/home/view/home_view.dart';
import 'package:subscriptionfairy/feature/subscriptions/view/subscriptions_view.dart';
import 'package:subscriptionfairy/product/core/app_cubit.dart';
import 'package:subscriptionfairy/product/core/app_state.dart';
import 'package:subscriptionfairy/product/widget/custom_loading.dart';

/// DashboardView
final class DashboardView extends StatefulWidget {
  /// DashboardView
  const DashboardView({super.key});
  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> with DashBoardMixin {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        if (state is AppLoadingState) {
          return const CustomLoading();
        } else if (state is AppLoadedState) {
          final appCubit = context.read<AppCubit>();
          final upLoadState = state;
          final users = state.users.subscriptionList;
          return _DashBoard(
            tabController: tabController,
            tabViews: tabViews,
            state: state,
          );
        } else if (state is AppErrorState) {
          return Center(
            child: Text(state.error),
          );
        } else {
          return const Center(
            child: Text('Unknown state'),
          );
        }
      },
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
    required this.state,
  });

  final TabController tabController;
  final List<Tab> tabViews;
  final AppLoadedState state;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: TabViews.values.length,
      child: _DashboardBody(
        tabController: tabController,
        tabViews: tabViews,
        state: state,
      ),
    );
  }
}

final class _DashboardBody extends StatelessWidget {
  const _DashboardBody({
    required this.tabController,
    required this.tabViews,
    required this.state,
  });

  final TabController tabController;
  final List<Tab> tabViews;
  final AppLoadedState state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _BottomAppBar(
        tabController: tabController,
        tabViewsList: tabViews,
      ),
      body: _DashboardView(
        tabController: tabController,
        state: state,
      ),
    );
  }
}

final class _DashboardView extends StatelessWidget {
  const _DashboardView({
    required TabController tabController,
    required this.state,
  }) : _tabController = tabController;

  final TabController _tabController;
  final AppLoadedState state;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      controller: _tabController,
      children: [
        HomeView(
          state: state,
        ),
        SubscriptionsView(
          state: state,
        ),
        const Placeholder(),
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

/// Tab views
enum TabViews {
  /// Subscription
  home,

  /// Notifications
  categories,

  /// offers
  offers,
}

/// TabViewsExtension
extension TabViewsExtension on TabViews {
  /// name
  String get name {
    switch (this) {
      case TabViews.home:
        return 'Ana Sayfa';
      case TabViews.categories:
        return '';
      case TabViews.offers:
        return 'Tekliflerim';
    }
  }

  /// icon
  Widget getIcon() {
    switch (this) {
      case TabViews.home:
        return const Icon(
          Icons.home,
        );
      case TabViews.categories:
        return const FloatingActionButton(
          onPressed: null,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        );
      case TabViews.offers:
        return const Icon(
          Icons.person,
        );
    }
  }
}

*/
