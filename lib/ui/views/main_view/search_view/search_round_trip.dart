import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:traveling/ui/shared/colors.dart';
import 'package:traveling/ui/shared/custom_widgets/custom_button.dart';
import 'package:traveling/ui/shared/custom_widgets/custom_image.dart';
import 'package:traveling/ui/shared/custom_widgets/custom_search_comtainer.dart';
import 'package:traveling/ui/shared/utils.dart';
import 'package:traveling/ui/views/main_view/search_view/search_oneway_view.dart';

class SearchViewRoundTrip extends StatelessWidget {
  const SearchViewRoundTrip ({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: ListView(
        children: [
          Container(
            color:AppColors.LightBlueColor ,
            child: Column(
              children: [
                Padding(
                  padding:  EdgeInsetsDirectional.only(top:screenWidth(15),start: screenWidth(20),end: screenWidth(3),bottom: screenWidth(30)  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                    Container(
                      width: screenWidth(10),
                      height: screenWidth(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppColors.backgroundgrayColor
                      ),
                      child: Icon(Icons.arrow_back_ios,color: AppColors.mainColorBlue,),
                    ),
                    Text('Search Flights' ,style: TextStyle(
                      fontSize: screenWidth(18),
                      fontWeight: FontWeight.w700,
                      color: AppColors.backgroundgrayColor
                    ),)
                   ],
                  ),
                ),
              Container(
                width: screenWidth(1),
                height: screenHeight(1.2),
                decoration: BoxDecoration(
                    color: AppColors.backgroundgrayColor,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
                ),
                child: Column(
                  children: [
                 Stack(
                   children: [
                     Padding(
                       padding:  EdgeInsetsDirectional.only(top:screenWidth(15),end: screenWidth(3)  ),
                       child: Container(
                             width: screenWidth(2.5),
                            height: screenHeight(18),
                        decoration: BoxDecoration(
                          color: AppColors.babyblueColor,
                          borderRadius: BorderRadiusDirectional.only(topStart: Radius.circular(20), bottomStart:Radius.circular(20) ,)
                        ),
                        child: InkWell(
                          onTap: () {
                            Get.off(SearchViewOneWay());
                          },
                          child: Center(child: Text('One - Way', style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: screenWidth(25)
                          ),),),
                        ),
                       ),
                     ),
                     Padding(
                       padding:  EdgeInsetsDirectional.only(top: screenWidth(15),start: screenWidth(2.7)),
                       child: CustomButton(text: 'Round_trip', textColor: AppColors.backgroundgrayColor, widthPercent: 2.5, heightPercent: 18),
                     ),
                    
                   ],
                 ),
                 SizedBox(height: screenWidth(7),),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                     Image(image: AssetImage('assets/image/png/line2.png' , ), ),
                     Column(
                      
                       children: [
                        CustomSearchContainer(widthPercent: 1.2, heightPercent: 7, boldtext: 'CAI - Cairo', icon:Icons.flight_takeoff_sharp , text: 'From', IconColor: AppColors.pinkColor,),
                         SizedBox(height: screenWidth(20),),
                        CustomSearchContainer(widthPercent: 1.2, heightPercent: 7, boldtext: 'RUH - Riyadh', icon: Icons.flight_land , text: 'To',IconColor: AppColors.pinkColor),
                       ],
                     )
                   
                   ],
                 ),
                 Padding(
                   padding:  EdgeInsetsDirectional.only(start: screenWidth(18),end:screenWidth(15),top: screenWidth(18)),
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomSearchContainer(widthPercent: 2.5, heightPercent: 7, boldtext: '22. Dec , 2023', icon:Icons.calendar_month_outlined , text: 'Depature date',IconColor: AppColors.IconBlueColor),
                      CustomSearchContainer(widthPercent: 2.5, heightPercent: 7, boldtext: '23. Dec , 2023', icon:Icons.calendar_month_outlined , text: 'Return_date', IconColor: AppColors.IconBlueColor,),
                    ],
                   ),
                 ),
                 Padding(
             padding:  EdgeInsetsDirectional.only(start: screenWidth(18),end:screenWidth(15),top: screenWidth(18),),          
                      child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomSearchContainer(widthPercent: 2.5, heightPercent: 7, boldtext: '1 Adults ', icon:Icons.groups , text: 'passengers',IconColor: AppColors.IconPurpleColor,),
                      CustomSearchContainer(widthPercent: 2.5, heightPercent: 7, boldtext: '0 Childern', icon: Icons.groups  , text: 'passengers',IconColor: AppColors.IconPurpleColor,),
                    ],
                   ),
                 ),
                 SizedBox(height: screenWidth(2),),
                   CustomButton(text: 'Search', textColor: AppColors.backgroundgrayColor, widthPercent: 1.1, heightPercent: 15)  
                  ],
                  
                ),
              ),
                  
                
            ],
              ),
          ),
        ],
      )));
  }
}