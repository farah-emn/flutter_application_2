import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:traveling/ui/shared/colors.dart';
import 'package:traveling/ui/shared/custom_widgets/custom_button.dart';
import 'package:traveling/ui/shared/custom_widgets/custom_image.dart';
import 'package:traveling/ui/shared/custom_widgets/custom_search_comtainer.dart';
import 'package:traveling/ui/shared/custom_widgets/custom_textfiled.dart';
import 'package:traveling/ui/shared/custom_widgets/custom_textgray.dart';
import 'package:traveling/ui/shared/utils.dart';
import 'package:traveling/ui/views/main_view/search_view/search_oneway_view.dart';
import 'package:traveling/ui/views/main_view/search_view/search_round_trip.dart';
import 'package:traveling/ui/views/traveller_details_view/traveller_details_view3.dart';

class TravellerDetailsView2 extends StatelessWidget {
  const TravellerDetailsView2 ({super.key});

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
                    Text('Traveller details' ,style: TextStyle(
                      fontSize: screenWidth(18),
                      fontWeight: FontWeight.w700,
                      color: AppColors.backgroundgrayColor
                    ),)
                   ],
                  ),
                ),
              Container(
                width: screenWidth(1),
                // height: screenHeight(1.1),
                decoration: BoxDecoration(
                    color: AppColors.backgroundgrayColor,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
                ),
                child: Column(
                  children: [
              Padding(
                padding:  EdgeInsetsDirectional.only(top: screenWidth(20),start: screenWidth(10),end: screenWidth(8)),
                child: Image(image: AssetImage('assets/image/png/progresssLinear.png')),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                
                children: [
                  CustomTextGray(mainText: 'Booking \nSummary'),
                  CustomTextGray(mainText: 'Guest\nDetails'),
                  CustomTextGray(mainText: 'Payments'),
                ],
              ),
              SizedBox(height: screenWidth(20),),
              Container(
                width: screenWidth(1.1),
                height: screenWidth(3),
                decoration: BoxDecoration(
                  color: AppColors.babyblueColor,
                  borderRadius: BorderRadiusDirectional.circular(25)
                ),
               child:Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  
                  Text('Use your passport or GCC National ID to \nquickly and securely auto-fill traveller\n details',style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(96, 96, 96, 1),
                    fontSize: screenWidth(25)
                  ),
                  textAlign: TextAlign.center,),
                  Container(
                    width: screenWidth(1.3),
                    height: screenWidth(10),
                    decoration: BoxDecoration(
                      color: AppColors.backgroundgrayColor,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Padding(
                      padding:  EdgeInsetsDirectional.all(10),
                      child: Center(
                        child: Text('Scan ID to add traveller',
                        style: TextStyle(
                          color: AppColors.mainColorBlue,
                          fontSize: screenWidth(25)
                        ),
                         
                        ),
                      ),
                    ),
                  ),
                ],
               )
               
              ),
                Padding(
                  padding:  EdgeInsetsDirectional.only(top: screenWidth(20),end: screenWidth(2)),
                  child: Text(' Traveller details ', style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: screenWidth(20),
                  ),),
                ),
               SizedBox(height: screenWidth(20),),
                     CustomTextField(prefIcon: Icons.person_2, colorIcon:AppColors.pinkColor, hintText: 'First name',),
                    SizedBox(height: screenWidth(20),),
                    CustomTextField(prefIcon: Icons.person_2, colorIcon:AppColors.pinkColor, hintText: 'Last name',),
                    SizedBox(height: screenWidth(20),),

                CustomTextField(prefIcon: Icons.public, colorIcon: AppColors.IconBlueColor, hintText: 'Nationalty',suffIcon: Icons.keyboard_arrow_down,),
                SizedBox(height: screenWidth(20),),
                CustomTextField(prefIcon: Icons.calendar_today, colorIcon: AppColors.IconPurpleColor, hintText: 'Date of Birth',),
                Padding(
                   padding:  EdgeInsetsDirectional.only(top: screenWidth(20),end: screenWidth(1.8),bottom: screenWidth(20)),
                  child: Text('Traveller details', style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: screenWidth(20),
                  ),),
                ),

                    
                    CustomTextField(prefIcon: Icons.email, colorIcon: Color.fromARGB(255, 133, 251, 137), hintText: 'Passport Number',suffIcon: Icons.keyboard_arrow_down,),
                    SizedBox(height: screenWidth(20),),
                    CustomTextField(prefIcon: Icons.public, colorIcon:Color.fromARGB(255, 133, 251, 137), hintText: 'Issuing country',suffIcon: Icons.keyboard_arrow_down,),
                     SizedBox(height: screenWidth(20),),

                    CustomTextField(prefIcon: Icons.calendar_today
                    , colorIcon:Color.fromARGB(255, 133, 251, 137), hintText: 'Expire date',suffIcon: Icons.keyboard_arrow_down,),


                 SizedBox(height: screenWidth(7),),
                   InkWell(
                    onTap: () {
                      Get.to(TravellerDetailsView3());
                    },
                    child: CustomButton(text: 'save', textColor: AppColors.backgroundgrayColor, widthPercent: 1.1, heightPercent: 15))  
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