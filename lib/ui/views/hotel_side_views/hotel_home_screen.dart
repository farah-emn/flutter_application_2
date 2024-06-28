import 'package:flutter/material.dart';
import 'package:traveling/ui/shared/colors.dart';
import 'package:traveling/ui/views/flight_side_views/flight_about_us_view.dart';
import 'package:traveling/ui/views/flight_side_views/flight_add_view.dart';
import 'package:traveling/ui/views/flight_side_views/flight_search_view.dart';
import 'hotel_add_view.dart';
import 'hotel_home_view.dart';
import 'hotel_about_us_view.dart';
import 'hotel_search_view.dart';

class HoteltHome extends StatefulWidget {
  const HoteltHome({super.key});

  @override
  State<HoteltHome> createState() => _HoteltHomeState();
}

class _HoteltHomeState extends State<HoteltHome> {
  int index = 0;
  final Screens = [
    const HotelHomeView(),
    const FlightSearchView(),
    const FlightAddView(),
    const FlightAboutUsView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: const NavigationBarThemeData(
            indicatorColor: AppColors.Blue,
            // indicatorShape: CircleBorder(),
            backgroundColor: Colors.white
            ),
        child: NavigationBar(
            elevation: 1,
            height: 60,
            selectedIndex: index,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
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
                  Icons.add_outlined,
                  color: AppColors.BlueText,
                ),
                selectedIcon: Icon(
                  Icons.add,
                  color: AppColors.backgroundgrayColor,
                ),
                label: 'add',
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.business_outlined,
                  color: AppColors.BlueText,
                ),
                selectedIcon: Icon(
                  Icons.business,
                  color: AppColors.backgroundgrayColor,
                ),
                label: 'About Us',
              ),
            ]),
      ),
    );
  }
}
