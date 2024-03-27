import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:traveling/ui/shared/colors.dart';
import 'package:traveling/ui/shared/custom_widgets/custom_button.dart';
import 'package:traveling/ui/shared/custom_widgets/custom_image.dart';
import 'package:traveling/ui/shared/custom_widgets/custom_textfiled.dart';
import 'package:traveling/ui/shared/custom_widgets/custom_textgray.dart';
import 'package:traveling/ui/shared/utils.dart';
import 'package:traveling/ui/views/main_view/main_view.dart';
import 'package:traveling/ui/views/signup_view/signup_view.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
      body: ListView(
      // color: AppColors.backgroundgrayColor,      
        children: [
           Container(
                width: size.width,
                height: size.height/4,
                decoration: BoxDecoration(image:
                DecorationImage(image: AssetImage('assets/image/png/header.png'),
                fit: BoxFit.cover
                )
                ),
              ),
          Container(
            color: AppColors.backgroundgrayColor,
            child: Column(
              children: [
               
                Padding(
                  padding:  EdgeInsetsDirectional.only(end: size.width/1.3,top:  size.width/5,bottom:  size.width/20),
                  child: Text('Sign in ' , style:  TextStyle( fontWeight: FontWeight.w800, fontSize:  size.width/20),),
                ),
                CustomTextField( 
                  prefIcon: Icons.call,
                  colorIcon: AppColors.pinkColor,
                  hintText: "Mobile Number",
                )
                ,SizedBox(height: screenWidth(30),),
                 CustomTextField(
                  prefIcon: Icons.lock,
                  colorIcon: AppColors.pinkColor,
                  hintText: "Password",
                ),
                SizedBox(height: screenWidth(15),),
          
                InkWell(
                  onTap: () {
                        Get.to(MainView());
                      },
                  child: CustomButton(text: 'Sign in',textColor: AppColors.backgroundgrayColor, heightPercent: 15, widthPercent: 1.1,)),
                SizedBox(height: screenHeight(20),),
                Center(
                 child: CustomTextGray(mainText: 'or sign in with ',),
                ),
                SizedBox(height: screenHeight(20),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                   CustomImage(imagename:'facebook_icon' ),
                   CustomImage(imagename:'google_icon' ),
                   CustomImage(imagename:'twitter_icon' ),
                  ],
                ),
              SizedBox(height: screenHeight(20),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextGray(mainText: 'You already have account? ')
                   , InkWell(
                    onTap: () {
                      Get.offAll(SignUpView());
                    },
                     child: Text('Sign up',
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
          ),
        ],
      ),
    ))
    ;
  }
}