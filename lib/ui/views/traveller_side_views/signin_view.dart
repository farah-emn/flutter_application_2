import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:traveling/ui/shared/colors.dart';
import 'package:traveling/ui/shared/custom_widgets/custom_button.dart';
import 'package:traveling/ui/shared/custom_widgets/custom_image.dart';
import 'package:traveling/ui/shared/custom_widgets/custom_textfiled.dart';
import 'package:traveling/ui/shared/custom_widgets/custom_textgray.dart';
import 'package:traveling/ui/shared/utils.dart';
import 'package:traveling/ui/views/traveller_side_views/home_screen.dart';
import 'package:traveling/ui/views/traveller_side_views/signup_view.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

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
                        'Sign in ',
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
                        text: 'Sign in',
                        textColor: AppColors.backgroundgrayColor,
                        heightPercent: 15,
                        widthPercent: 1.1,
                      )),
                  SizedBox(
                    height: screenHeight(20),
                  ),
                  Center(
                    child: CustomTextGray(
                      mainText: 'or sign in with ',
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
                          Get.offAll(SignUpView());
                        },
                        child: Text(
                          'Sign up',
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
    );
  }
}
