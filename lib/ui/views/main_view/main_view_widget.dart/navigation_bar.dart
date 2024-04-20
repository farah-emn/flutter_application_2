import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:traveling/core/enums/bottom_nav.dart';
import 'package:traveling/ui/shared/colors.dart';
import 'package:traveling/ui/shared/utils.dart';
import 'package:traveling/ui/views/main_view/main_view_widget.dart/nav_item.dart';
import 'package:traveling/ui/views/main_view/search_view/search_oneway_view.dart';

class NavBar extends StatefulWidget {
  final BottomNavigationEnum selected;
  final Function(BottomNavigationEnum, int) mainTap;

  const NavBar({
    super.key,
    required this.selected,
    required this.mainTap,
  });

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: AppColors.backgroundgrayColor,
      height: 56,
      child: BottomAppBar(
        elevation: 0,
        child: SizedBox(
          height: 56,
          width: size.width,
          child: Padding(
            padding: EdgeInsets.only(left: 25, right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NavItem(
                    icon: Icons.home,
                    isSelected: widget.selected == BottomNavigationEnum.HOME,
                    onTap: () {
                      widget.mainTap(BottomNavigationEnum.HOME, 0);
                    }),
                NavItem(
                    icon: Icons.search,
                    isSelected:
                        widget.selected == BottomNavigationEnum.SEARCH,
                    onTap: () {
                      Get.to(SearchViewOneWay());
                    }),
                NavItem(
                    icon: Icons.person,
                    isSelected:
                        widget.selected == BottomNavigationEnum.PROFILE,
                    onTap: () {
                      widget.mainTap(BottomNavigationEnum.PROFILE, 2);
                    }),
              ],
            ),
          ),
        ),
      ),
      // child: Row(
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //   children: [
      //     NavItem(
      //         icon: Icons.home,
      //         isSelected: widget.selected == BottomNavigationEnum.HOME,
      //         onTap: () {
      //           widget.mainTap(BottomNavigationEnum.HOME, 0);
      //         }),
      //     NavItem(
      //         icon: Icons.search,
      //          isSelected: widget.selected == BottomNavigationEnum.SEARCH,
      //         onTap:
      //         () {
      //         Get.to(SearchViewOneWay());
      //         }
      //         ),
      //     NavItem(
      //         icon: Icons.person,
      //         isSelected: widget.selected == BottomNavigationEnum.PROFILE,
      //         onTap: () {
      //           widget.mainTap(BottomNavigationEnum.PROFILE, 2);
      //         }),
      //   ],
      // ),
    );
  }
}
