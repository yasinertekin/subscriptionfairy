import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gen/src/index.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:subscriptionfairy/feature/home/home_view.dart';
import 'package:subscriptionfairy/feature/subscriptions/subscriptions_view.dart';

/// This is the view for the bottom navigation bar feature.
final class CustomBottomNavigationBar extends StatelessWidget {
  /// This is the constructor for the bottom navigation bar view.
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = PersistentTabController();
    return PersistentTabView(
      navBarStyle: NavBarStyle.style15,
      context,
      controller: controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      resizeToAvoidBottomInset: true,
      popAllScreensOnTapAnyTabs: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(20),
        colorBehindNavBar: Colors.white,
      ),
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        curve: Curves.easeIn,
        animateTabTransition: true,
      ),
    );
  }
}

List<Widget> _buildScreens() {
  return [
    const HomeView(),
    const SubscriptionsView(),
    const Text('dfsdfsdf'),
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
