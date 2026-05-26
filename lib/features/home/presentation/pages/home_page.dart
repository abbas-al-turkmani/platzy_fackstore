import 'package:flutter/material.dart';

import 'package:platzy_fackstore/features/home/presentation/pages/notifications_page.dart';
import 'package:platzy_fackstore/features/home/presentation/pages/orders_page.dart';
import 'package:platzy_fackstore/features/home/presentation/pages/profile_page.dart';

import '../../../../core/theme_management/extensions/any_page_theme/any_page_theme.dart';
import '../../../../core/widgets/app_navigation_bar.dart';
import '../../../../core/widgets/search_widget.dart';
import '../widget/categories/categories_section.dart';
import '../widget/home_top_section.dart';
import '../widget/products/top_selling_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    this.selectedPage,
  });

  final MainScreenPages? selectedPage;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int currentPageIndex;

  int _getPageIndex() {
    switch (widget.selectedPage) {
      case null:
        return 0;
      case MainScreenPages.home:
        return 0;
      case MainScreenPages.notification:
        return 1;
      case MainScreenPages.orders:
        return 2;
      case MainScreenPages.profile:
        return 3;
    }
  }

  @override
  void initState() {
    currentPageIndex = _getPageIndex();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AnyPageTheme pageTheme =
        Theme.of(context).extensions[AnyPageTheme] as AnyPageTheme;

    List<Widget> pages = [
      const MainPage(),
      const NotificationsPage(),
      const OrdersPage(),
      const ProfilePage(),
    ];

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: AppNavigationBar(
          currentIndex: currentPageIndex,
          onTap: (index) => setState(
            () => currentPageIndex = index,
          ),
        ),
        backgroundColor: pageTheme.background,
        body: pages[currentPageIndex],
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Header section
            HomeTopSection(),
            SizedBox(height: 20),

            // search
            SearchWidget(),
            SizedBox(height: 20),

            // catigories section
            CatigoriesSection(),
            SizedBox(height: 20),

            // Top selling section
            TopSellingSection(),

            // footer
          ],
        ),
      ),
    );
  }
}

enum MainScreenPages {
  home,
  notification,
  orders,
  profile,
}
