// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:traveling/core/enums/bottom_nav.dart';
import 'package:traveling/ui/views/hotel_views/hotel_details_view/hotelDetailsScreen.dart';
import 'package:traveling/ui/views/hotel_views/hotel_Info_view/hotelInfoScreen.dart';
import 'package:traveling/ui/views/main_view/home_view/home_view.dart';
import 'package:traveling/ui/views/main_view/main_view_widget.dart/navigation_bar.dart';
import 'package:traveling/ui/views/main_view/profile_view/profile_view.dart';
import 'package:traveling/ui/views/main_view/search_view/search_oneway_view.dart';

// import 'package:lottie/lottie.dart';
// import 'package:image_picker/image_picker.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  PageController controller = PageController();

  BottomNavigationEnum selectedView = BottomNavigationEnum.HOME;

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: scaffoldKey,
      bottomNavigationBar: NavBar(
        selected: selectedView,
        mainTap: (selecteEnum, index) {
          setState(() {
            selectedView = selecteEnum;
          });
          // controller.animateToPage(index,
          //     duration: Duration(milliseconds: 50), curve: Curves.easeOutSine);
          controller.jumpToPage(
            index,
          );
        },
      ),
      body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: controller,
          children: [
            HotelDetailsScreen(),
            SearchViewOneWay(),
            TravellerDetailsView1(),
          ]),
    ));
  }
}
