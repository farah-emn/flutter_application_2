// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:traveling/ui/shared/colors.dart';
import 'package:traveling/ui/shared/custom_widgets/custom_button.dart';
import 'package:traveling/ui/shared/custom_widgets/custom_textfiled.dart';
import 'package:traveling/ui/shared/custom_widgets/custom_textgray.dart';
import 'package:traveling/ui/shared/utils.dart';

import '../../flights_view/flights_view.dart';

class HotelPaymentsView extends StatelessWidget {
  const HotelPaymentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: ListView(
      children: [
        Container(
          color: AppColors.LightBlueColor,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(
                    top: screenWidth(15),
                    start: screenWidth(20),
                    end: screenWidth(3),
                    bottom: screenWidth(30)),
                child: Row(
                  children: [
                    Container(
                      width: screenWidth(12),
                      height: screenWidth(12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: AppColors.backgroundgrayColor),
                      child: const Icon(
                        Icons.arrow_back_ios_rounded,
                        color: AppColors.mainColorBlue,
                      ),
                    ),
                    SizedBox(
                      width: screenWidth(4),
                    ),
                    Text(
                      'Payments',
                      style: TextStyle(
                          fontSize: screenWidth(18),
                          fontWeight: FontWeight.w700,
                          color: AppColors.backgroundgrayColor),
                    )
                  ],
                ),
              ),
              Container(
                width: screenWidth(1),
                // height: screenHeight(1.1),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/image/png/background1.png'),
                      fit: BoxFit.fill),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                          top: screenWidth(20),
                          start: screenWidth(10),
                          end: screenWidth(8)),
                      child: const Image(
                          image: AssetImage(
                              'assets/image/png/progresssLinear.png')),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomTextGray(mainText: 'Booking \nSummary'),
                        CustomTextGray(mainText: 'Guest\nDetails'),
                        CustomTextGray(mainText: 'Payments'),
                      ],
                    ),
                    SizedBox(
                      height: screenWidth(20),
                    ),
                    const CustomTextField(
                      prefIcon: Icons.credit_card_rounded,
                      colorIcon: AppColors.IconPurpleColor,
                      hintText: 'First name',
                    ),
                    SizedBox(
                      height: screenWidth(20),
                    ),
                    const CustomTextField(
                      prefIcon: Icons.date_range,
                      colorIcon: Color.fromARGB(255, 198, 237, 195),
                      hintText: 'Card expiration date',
                    ),
                    SizedBox(
                      height: screenWidth(20),
                    ),
                    const CustomTextField(
                      prefIcon: Icons.person,
                      colorIcon: AppColors.IconBlueColor,
                      hintText: 'Name of card holder',
                      suffIcon: Icons.keyboard_arrow_down,
                    ),
                    SizedBox(height: screenWidth(1.26)),
                    Container(
                        alignment: Alignment.bottomLeft,
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsetsDirectional.only(
                              start: screenWidth(30), top: screenHeight(86)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    height: screenHeight(40),
                                  ),
                                  Text(
                                    'Total to be paid:',
                                    style: TextStyle(
                                      fontSize: screenWidth(25),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    '2231',
                                    style: TextStyle(
                                        fontSize: screenWidth(18),
                                        color: AppColors.mainColorBlue),
                                  ),
                                  Text(
                                    'SAR',
                                    style: TextStyle(
                                      fontSize: screenWidth(26),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: screenHeight(80),
                              )
                            ],
                          ),
                        )),
                    SizedBox(height: screenWidth(650)),
                    Container(
                      alignment: Alignment.bottomLeft,
                      color: Colors.white,
                      child: InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          20.0), // Set your desired border radius
                                    ),
                                    backgroundColor: Colors.white,
                                    child: Container(
                                      width: screenWidth(1),
                                      height: screenHeight(2.4),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsetsDirectional.only(
                                                start: screenWidth(1.5),
                                                top: screenHeight(70)),
                                            child: Image.asset(
                                              'assets/image/png/cancel_icon.png',
                                            ),
                                          ),
                                          SizedBox(
                                            height: screenHeight(60),
                                          ),
                                          Image.asset(
                                              'assets/image/png/success_icon.png',
                                              alignment: Alignment.bottomLeft,
                                              width: screenWidth(4)),
                                          SizedBox(
                                            height: screenHeight(80),
                                          ),
                                          Text(
                                            'SUCCESS!',
                                            style: TextStyle(
                                                color: AppColors.mainColorBlue,
                                                fontWeight: FontWeight.bold,
                                                fontSize: screenWidth(16)),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            '''Your flight has been 
booked successfully.''',
                                            style: TextStyle(
                                                fontSize: screenWidth(24),
                                                color: Color.fromARGB(
                                                    255, 112, 110, 110)),
                                          ),
                                          SizedBox(
                                            height: 60,
                                          ),
                                          InkWell(
                                              onTap: () {
                                                Get.to(FlightsView());
                                              },
                                              child: CustomButton(
                                                  text: 'Confirm',
                                                  textColor: AppColors
                                                      .backgroundgrayColor,
                                                  widthPercent: 1.35,
                                                  heightPercent: 20))
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                          child: Center(
                              child: CustomButton(
                                  text: 'Confirm',
                                  textColor: AppColors.backgroundgrayColor,
                                  widthPercent: 1.1,
                                  heightPercent: 19))),
                    )
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
