import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:traveling/ui/shared/colors.dart';
import 'package:traveling/ui/views/traveller_side_views/home_view.dart';
import 'package:traveling/ui/views/traveller_side_views/menu_view.dart';
import 'package:traveling/ui/views/traveller_side_views/notifications_view.dart';
import 'package:traveling/ui/views/traveller_side_views/profile_view.dart';
import 'package:traveling/ui/views/traveller_side_views/search_oneway_view/search_oneway_view.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;
  final Screens = [
    const HomeView(),
    SearchViewOneWay(),
    const NotificationsView(),
    const ProfileView()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: const NavigationBarThemeData(
            indicatorColor: AppColors.darkBlue,
            indicatorShape: CircleBorder(),
            backgroundColor: Colors.white),
        child: NavigationBar(
            elevation: 1,
            height: 60,
            selectedIndex: index,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            animationDuration: const Duration(seconds: 2),
            onDestinationSelected: (index) => setState(() {
                  this.index = index;
                }),
            destinations: const [
              NavigationDestination(
                icon: Icon(
                  Icons.home_outlined,
                  color: AppColors.BlueText,
                ),
                selectedIcon: Icon(
                  Icons.home_filled,
                  color: AppColors.backgroundgrayColor,
                ),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.search_outlined,
                  color: AppColors.BlueText,
                ),
                selectedIcon: Icon(
                  Icons.search_outlined,
                  color: AppColors.backgroundgrayColor,
                ),
                label: 'Search',
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.notifications_none_outlined,
                  color: AppColors.BlueText,
                ),
                selectedIcon: Icon(
                  Icons.notifications,
                  color: AppColors.backgroundgrayColor,
                ),
                label: 'notifications',
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.person_2_outlined,
                  color: AppColors.BlueText,
                ),
                selectedIcon: Icon(
                  Icons.person_2_rounded,
                  color: AppColors.backgroundgrayColor,
                ),
                label: 'Profile',
              ),
            ]),
      ),
    );
  }
}
