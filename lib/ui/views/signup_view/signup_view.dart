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

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

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
                  child: Text('Sign up ' , style:  TextStyle( fontWeight: FontWeight.w800, fontSize:  size.width/20),),
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
                  child: CustomButton(text: 'Sign Up', widthPercent: 1.1, heightPercent: 15, textColor: AppColors.backgroundgrayColor,)),
                SizedBox(height: screenHeight(20),),
                Center(
                 child: CustomTextGray(mainText: 'or continue with ',),
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
                    CustomTextGray(mainText: 'You don\'t have account? ')
                   , InkWell(
                    onTap: () {
                      Get.to(SignInView());
                    },
                     child: Text('Sign In',
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