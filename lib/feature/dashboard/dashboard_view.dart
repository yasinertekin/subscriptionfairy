import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: implementation_imports
import 'package:gen/src/index.dart';
import 'package:kartal/kartal.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:subscriptionfairy/feature/home/home_view.dart';
import 'package:subscriptionfairy/feature/subscriptions/subscriptions_view.dart';
import 'package:subscriptionfairy/product/base/base_cubit.dart';
import 'package:subscriptionfairy/product/base/base_state.dart';

/// This is the view for the bottom navigation bar feature.
final class DashboardView extends StatelessWidget {
  /// Constructor of DashboardView
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    const milliSeconds = 200;
    final controller = PersistentTabController();
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        if (state is AppLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is AppLoadedState) {
          final appCubit = context.read<AppCubit>();
          final upLoadState = state;
          return PersistentTabView(
            navBarStyle: NavBarStyle.style15,
            context,
            controller: controller,
            screens: _buildScreens(
              upLoadState,
              appCubit,
            ),
            items: _navBarsItems(),
            resizeToAvoidBottomInset: true,
            popAllScreensOnTapAnyTabs: true,
            decoration: NavBarDecoration(
              borderRadius: context.border.lowBorderRadius,
              colorBehindNavBar: ColorName.colorWhite,
            ),
            itemAnimationProperties: const ItemAnimationProperties(
              // Navigation Bar's items animation properties.
              duration: Duration(
                milliseconds: milliSeconds,
              ),
              curve: Curves.ease,
            ),
            screenTransitionAnimation: const ScreenTransitionAnimation(
              curve: Curves.easeIn,
              animateTabTransition: true,
            ),
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
}

List<Widget> _buildScreens(
  AppLoadedState state,
  AppCubit appCubit,
) {
  return [
    HomeView(
      state: state,
      appcubit: appCubit,
    ),
    SubscriptionsView(
      state: state,
    ),
    Center(
      child: Text(FirebaseAuth.instance.currentUser?.uid ?? 'No user'),
    ),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      inactiveColorPrimary: ColorName.colorGrey,
      inactiveColorSecondary: ColorName.colorGrey,
      activeColorPrimary: ColorName.colorRed,
      title: 'Home',
      icon: const Icon(
        CupertinoIcons.home,
      ),
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(
        CupertinoIcons.add,
        color: ColorName.colorWhite,
      ),
      activeColorPrimary: ColorName.colorRed,
      inactiveColorPrimary: ColorName.colorGrey,
      inactiveColorSecondary: ColorName.colorGrey,
      title: 'Add',
    ),
    PersistentBottomNavBarItem(
      activeColorPrimary: ColorName.colorRed,
      inactiveColorPrimary: ColorName.colorGrey,
      inactiveColorSecondary: ColorName.colorGrey,
      icon: const Icon(
        CupertinoIcons.profile_circled,
      ),
      title: 'Profile',
    ),
  ];
}
