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
    return Scaffold(
        backgroundColor: AppColors.StatusBarColor,
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: 20,
                  left: 15,
                ),
                alignment: Alignment.centerRight,
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppColors.backgroundgrayColor,
                ),
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.mainColorBlue,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 60,
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/image/png/background1.png'),
                        fit: BoxFit.fill),
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(
              //     top: 60,
              //   ),
              //   child: Container(
              //     decoration: const BoxDecoration(
              //       image: DecorationImage(
              //           image: AssetImage('assets/image/png/background1.png'),
              //           fit: BoxFit.fill),
              //     ),
              //   ),
              // ),
              Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Payment',
                        style: TextStyle(
                            fontSize: screenWidth(18),
                            fontWeight: FontWeight.w700,
                            color: AppColors.backgroundgrayColor),
                      )
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 40,
                      left: 20,
                      right: 20,
                    ),
                    child: const Image(
                        image:
                            AssetImage('assets/image/png/progresssLinear.png')),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      right: 15,
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Booking \nSummary',
                          style: TextStyle(
                              fontSize: 13, color: AppColors.TextgrayColor),
                        ),
                        Text(
                          'Guest\nDetails',
                          style: TextStyle(
                              fontSize: 13, color: AppColors.TextgrayColor),
                        ),
                        Text(
                          'Payments',
                          style: TextStyle(
                              fontSize: 13, color: AppColors.TextgrayColor),
                        ),
                        // CustomTextGray(
                        //   mainText: 'Booking \nSummary',
                        // ),
                        // CustomTextGray(mainText: 'Guest\nDetails'),
                        // CustomTextGray(mainText: 'Payments'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  const CustomTextField(
                    prefIcon: Icons.credit_card_rounded,
                    colorIcon: AppColors.IconPurpleColor,
                    hintText: 'First name',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  const CustomTextField(
                    prefIcon: Icons.date_range,
                    colorIcon: Color.fromARGB(255, 198, 237, 195),
                    hintText: 'Card expiration date',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  const CustomTextField(
                    prefIcon: Icons.person,
                    colorIcon: AppColors.IconBlueColor,
                    hintText: 'Name of card holder',
                    suffIcon: Icons.keyboard_arrow_down,
                  ),
                  Spacer(),
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
                              children: const [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Total to be paid:',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  '2231',
                                  style: TextStyle(
                                    fontSize: screenWidth(18),
                                    color: AppColors.mainColorBlue,
                                    fontWeight: FontWeight.w500,
                                  ),
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
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Your flight has been\n booked successfully.',
                                            style: TextStyle(
                                                fontSize: screenWidth(24),
                                                color: Color.fromARGB(
                                                    255, 112, 110, 110)),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 50,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.to(FlightsView());
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            left: 15,
                                            right: 15,
                                            bottom: 15,
                                          ),
                                          child: CustomButton(
                                              text: 'Confirm',
                                              textColor:
                                                  AppColors.backgroundgrayColor,
                                              widthPercent: 1.35,
                                              heightPercent: 20),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 15,
                          right: 15,
                          bottom: 15,
                        ),
                        child: CustomButton(
                            text: 'Confirm',
                            textColor: AppColors.backgroundgrayColor,
                            widthPercent: 1.1,
                            heightPercent: 19),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
