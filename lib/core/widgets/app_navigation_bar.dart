import 'package:platzy_fackstore/core/constants/strings.dart';
import 'package:platzy_fackstore/core/theme_management/extensions/my_navigation_bar_theme/my_navigation_bar_theme.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final void Function(int index) onTap;

  @override
  Widget build(BuildContext context) {
    MyNavigationBarTheme theme = Theme.of(context).extension()!;

    List<NavigationBarItemModel> bottomNavigationBarItems = [
      NavigationBarItemModel(
        iconData: Iconsax.home_2,
        label: Strings.home,
      ),
      NavigationBarItemModel(
        iconData: Iconsax.notification_bing,
        label: Strings.notifications,
      ),
      NavigationBarItemModel(
        iconData: Iconsax.receipt,
        label: Strings.orders,
      ),
      NavigationBarItemModel(
        iconData: Iconsax.profile_tick,
        label: Strings.porfile,
      ),
    ];
    return BottomNavigationBar(
      backgroundColor: theme.backgroundColor,
      showSelectedLabels: false,
      currentIndex: currentIndex,
      onTap: onTap,
      items: List.generate(
        bottomNavigationBarItems.length,
        (index) => BottomNavigationBarItem(
          backgroundColor: theme.backgroundColor,
          tooltip: bottomNavigationBarItems[index].label,
          activeIcon: Icon(
            bottomNavigationBarItems[index].iconData,
            color: theme.navigationBarIconActive,
          ),
          label: bottomNavigationBarItems[index].label,
          icon: Icon(
            bottomNavigationBarItems[index].iconData,
            color: theme.navigationBarIcon,
          ),
        ),
      ),
    );
  }
}

class NavigationBarItemModel {
  final IconData iconData;
  final String label;

  NavigationBarItemModel({
    required this.iconData,
    required this.label,
  });
}
