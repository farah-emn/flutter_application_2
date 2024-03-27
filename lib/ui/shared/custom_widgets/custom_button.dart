import 'package:flutter/material.dart';
import 'package:traveling/ui/shared/colors.dart';
import 'package:traveling/ui/shared/utils.dart';



class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.text,
    required this.textColor,
    this.borderColor,
     required this.widthPercent, required this.heightPercent, 
  });

  final String text;
  final double widthPercent;
  final double heightPercent;
  final Color? borderColor;
  final Color textColor;
  

  @override
  Widget build(BuildContext context) {
    return Container(
        width:   screenWidth(widthPercent),
        height:  screenHeight(heightPercent),
     decoration: BoxDecoration(
      color: AppColors.mainColorBlue,
      borderRadius: BorderRadius.circular(20),
     ),
      child:
          Center(
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: screenWidth(25)
              ),
            ),
          ),
      
      
    
      );
  }
}