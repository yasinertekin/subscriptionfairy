import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subscriptionfairy/feature/dashboard/mixin/dashhboard_mixin.dart';
import 'package:subscriptionfairy/feature/home/view/home_view.dart';
import 'package:subscriptionfairy/feature/profile/profile_view.dart';
import 'package:subscriptionfairy/feature/subscriptions/view/subscriptions_view.dart';
import 'package:subscriptionfairy/product/core/app_cubit.dart';
import 'package:subscriptionfairy/product/core/app_state.dart';
import 'package:subscriptionfairy/product/initialize/language/locale_keys.g.dart';
import 'package:subscriptionfairy/product/utility/enum/tab_views.dart';
import 'package:subscriptionfairy/product/widget/custom_loading.dart';

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
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        if (state is AppLoadingState) {
          return const CustomLoading();
        } else if (state is AppLoadedState) {
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
          return Center(
            child: const Text(LocaleKeys.dashboard_unknownState).tr(),
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
        const ProfileView(),
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
