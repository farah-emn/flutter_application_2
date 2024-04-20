import 'package:flutter/material.dart';
import 'package:traveling/ui/shared/colors.dart';
import 'package:traveling/ui/views/main_view/home_view/home_view.dart';
import 'package:traveling/ui/views/profile_view/profile_view.dart';

import '../search_view/search_oneway_view.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;
  final  Screens = [const HomeView(), const SearchViewOneWay(), const ProfileView()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: const NavigationBarThemeData(
          
            indicatorColor: AppColors.LightBlueColor,
            backgroundColor: Colors.white),
        child: NavigationBar(
          elevation: 1,
            height: 70,
            selectedIndex: index,
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            animationDuration: Duration(seconds: 2),
            onDestinationSelected: (index) => setState(() {
                  this.index = index;
                }),
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home_filled, color: AppColors.mainColorBlue,),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.search_outlined),
                selectedIcon: Icon(Icons.search_outlined, color: AppColors.mainColorBlue,),
                label: 'Search',
              ),
              NavigationDestination(
                icon: Icon(Icons.person_2_outlined),
                selectedIcon: Icon(Icons.person_2, color: AppColors.mainColorBlue,),
                label: 'Profile',
              ),
            ]),
      ),
    );
  }
}
