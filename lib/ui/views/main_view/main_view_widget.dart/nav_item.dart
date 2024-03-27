import 'package:flutter/material.dart';
import 'package:traveling/ui/shared/colors.dart';

class NavItem extends StatelessWidget {
  final IconData icon;
  final bool? isSelected;
  final Function onTap;
  const NavItem(
      {super.key, required this.icon, this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(
                
        );
      },   
        child: Icon(
          icon,
          color: isSelected! ? AppColors.mainColorBlue :AppColors.TextgrayColor,
        ),
      
    );
  }
}
