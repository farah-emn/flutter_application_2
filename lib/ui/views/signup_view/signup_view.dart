import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:traveling/ui/shared/colors.dart';
import 'package:traveling/ui/shared/custom_widgets/custom_button.dart';
import 'package:traveling/ui/shared/custom_widgets/custom_image.dart';
import 'package:traveling/ui/shared/custom_widgets/custom_textfiled.dart';
import 'package:traveling/ui/shared/custom_widgets/custom_textgray.dart';
import 'package:traveling/ui/shared/utils.dart';
import 'package:traveling/ui/views/main_view/main_view.dart';
import 'package:traveling/ui/views/signin_view/signin_view.dart';

import '../main_view/home_view/home_screen.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.StatusBarColor,
      body: Stack(
        children: [
          const Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "T",
                    style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.w700,
                        color: AppColors.mainColorBlue),
                  ),
                  Text(
                    "ravell",
                    style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 255, 170, 42)),
                  ),
                  Text(
                    "ing",
                    style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 200,
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/image/png/back.png'),
                        fit: BoxFit.fill),
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 280,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Sign up ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: size.width / 20),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const CustomTextField(
                    prefIcon: Icons.call,
                    colorIcon: AppColors.pinkColor,
                    hintText: "Mobile Number",
                  ),
                  SizedBox(
                    height: screenWidth(30),
                  ),
                  const CustomTextField(
                    prefIcon: Icons.lock,
                    colorIcon: AppColors.pinkColor,
                    hintText: "Password",
                  ),
                  SizedBox(
                    height: screenWidth(15),
                  ),
                  InkWell(
                      onTap: () {
                        Get.to(Home());
                      },
                      child: CustomButton(
                        text: 'Sign up',
                        textColor: AppColors.backgroundgrayColor,
                        heightPercent: 15,
                        widthPercent: 1.1,
                      )),
                  SizedBox(
                    height: screenHeight(20),
                  ),
                  Center(
                    child: CustomTextGray(
                      mainText: 'or sign up with ',
                    ),
                  ),
                  SizedBox(
                    height: screenHeight(20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomImage(imagename: 'facebook_icon'),
                      CustomImage(imagename: 'google_icon'),
                      CustomImage(imagename: 'twitter_icon'),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight(20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextGray(mainText: 'You already have account? '),
                      InkWell(
                        onTap: () {
                          Get.offAll(SignInView());
                        },
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                            color: AppColors.mainColorBlue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ],
      ),
      //   body: ListView(
      // // color: AppColors.backgroundgrayColor,
      // children: [
      //   Container(
      //     width: size.width,
      //     height: size.height / 4,
      //     decoration: BoxDecoration(
      //         image: DecorationImage(
      //             image: AssetImage('assets/image/png/header.png'),
      //             fit: BoxFit.cover)),
      //   ),
      //   Container(
      //     color: AppColors.backgroundgrayColor,
      //     child: Column(
      //       children: [
      //         Padding(
      //           padding: EdgeInsetsDirectional.only(
      //             end: size.width / 1.4,
      //             top: size.width / 5,
      //           ),
      //           child: Text(
      //             'Sign up ',
      //             style: TextStyle(
      //                 fontWeight: FontWeight.bold, fontSize: size.width / 20),
      //           ),
      //         ),
      //         SizedBox(
      //           height: 15,
      //         ),
      //         CustomTextField(
      //           prefIcon: Icons.call,
      //           colorIcon: AppColors.pinkColor,
      //           hintText: "Mobile Number",
      //         ),
      //         SizedBox(
      //           height: screenWidth(30),
      //         ),
      //         CustomTextField(
      //           prefIcon: Icons.lock,
      //           colorIcon: AppColors.pinkColor,
      //           hintText: "Password",
      //         ),
      //         SizedBox(
      //           height: screenWidth(15),
      //         ),
      //         InkWell(
      //             onTap: () {
      //               Get.to(MainView());
      //             },
      //             child: CustomButton(
      //               text: 'Sign Up',
      //               widthPercent: 1.1,
      //               heightPercent: 15,
      //               textColor: AppColors.backgroundgrayColor,
      //             )),
      //         SizedBox(
      //           height: screenHeight(20),
      //         ),
      //         Center(
      //           child: CustomTextGray(
      //             mainText: 'or continue with ',
      //           ),
      //         ),
      //         SizedBox(
      //           height: screenHeight(20),
      //         ),
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //           children: [
      //             CustomImage(imagename: 'facebook_icon'),
      //             CustomImage(imagename: 'google_icon'),
      //             CustomImage(imagename: 'twitter_icon'),
      //           ],
      //         ),
      //         SizedBox(
      //           height: screenHeight(20),
      //         ),
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             CustomTextGray(mainText: 'You don\'t have account? '),
      //             InkWell(
      //               onTap: () {
      //                 Get.to(SignInView());
      //               },
      //               child: Text(
      //                 'Sign In',
      //                 style: TextStyle(
      //                   color: AppColors.mainColorBlue,
      //                   fontWeight: FontWeight.bold,
      //                 ),
      //               ),
      //             )
      //           ],
      //         )
      //       ],
      //     ),
      //   ),
      // ],
      //   ),
    );
  }
}
