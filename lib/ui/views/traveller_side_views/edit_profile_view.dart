// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:traveling/ui/shared/colors.dart';
import 'package:traveling/ui/shared/custom_widgets/custom_button.dart';
import 'package:traveling/ui/shared/custom_widgets/custom_textfiled.dart';
import 'package:traveling/ui/shared/utils.dart';

import 'room_view.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColors.LightBlueColor,
            resizeToAvoidBottomInset: false,
            body: Stack(children: [
              Padding(
                padding: EdgeInsetsDirectional.only(
                    top: screenWidth(18),
                    start: screenWidth(20),
                    end: screenWidth(3),
                    bottom: screenWidth(30)),
                child: Row(
                  children: [
                    Container(
                      width: screenWidth(10),
                      height: screenWidth(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppColors.backgroundgrayColor,
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.mainColorBlue,
                      ),
                    ),
                    SizedBox(width: screenWidth(3.8)),
                    Text(
                      'Profile',
                      style: TextStyle(
                          fontSize: screenWidth(18),
                          fontWeight: FontWeight.w700,
                          color: AppColors.backgroundgrayColor),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(top: screenHeight(12)),
                child: Container(
                  width: screenWidth(1),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/image/png/background1.png'),
                        fit: BoxFit.fill),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                    top: screenWidth(3.5),
                    start: screenWidth(10),
                    end: screenWidth(8)),
                child: Center(
                  child: Column(
                    children: [
                      Image(
                        image: AssetImage('assets/image/png/user.png'),
                        width: screenWidth(5),
                      ),
                      SizedBox(height: screenHeight(80)),
                      Text(
                        "User name",
                        style: TextStyle(
                            fontSize: screenWidth(24),
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(top: screenHeight(3.5)),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: screenWidth(30),
                      ),
                      CustomTextField(
                        hintText: 'First name',
                        prefIcon: Icons.person_2,
                        colorIcon: const Color.fromARGB(255, 255, 181, 215),
                      ),
                      SizedBox(
                        height: screenWidth(30),
                      ),
                      CustomTextField(
                        prefIcon: Icons.person_2,
                        colorIcon: const Color.fromARGB(255, 255, 181, 215),
                        hintText: 'Last name',
                      ),
                      SizedBox(
                        height: screenWidth(30),
                      ),
                      CustomTextField(
                        prefIcon: Icons.public,
                        colorIcon: AppColors.IconBlueColor,
                        hintText: 'Nationalty',
                        suffIcon: Icons.keyboard_arrow_down,
                      ),
                      SizedBox(
                        height: screenWidth(50),
                      ),
                      Padding(
                          padding:
                              EdgeInsets.only(right: screenWidth(1.5), top: 6),
                          child: const Text(
                            'Date of Birth',
                            style: TextStyle(
                                color: AppColors.TextgrayColor, fontSize: 18),
                          )),
                      Padding(
                        padding: EdgeInsetsDirectional.only(
                            start: screenWidth(20), end: screenWidth(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextField(
                              colorIcon: AppColors.TextFieldcolor,
                              hintText: 'D',
                              maxWidth: 100,
                              suffIcon: Icons.arrow_drop_down,
                              prefIcon: Icons.abc,
                            ),
                            CustomTextField(
                              colorIcon: AppColors.TextFieldcolor,
                              hintText: 'M',
                              maxWidth: 110,
                              prefIcon: Icons.abc,
                              suffIcon: Icons.arrow_drop_down,
                            ),
                            CustomTextField(
                              colorIcon: AppColors.TextFieldcolor,
                              hintText: 'Y',
                              prefIcon: Icons.abc,
                              maxWidth: 110,
                              suffIcon: Icons.arrow_drop_down,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: screenWidth(30),
                      ),
                      CustomTextField(
                        prefIcon: Icons.phone,
                        colorIcon: Color.fromARGB(255, 198, 237, 195),
                        hintText: 'Mobile Number',
                      ),
                      SizedBox(
                        height: screenWidth(30),
                      ),
                      CustomTextField(
                        prefIcon: Icons.email,
                        colorIcon: Color.fromARGB(255, 175, 153, 255),
                        hintText: 'Email',
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsetsDirectional.only(top: screenHeight(1.2)),
                  child: InkWell(
                      onTap: () {
                        Get.to(RoomView());
                      },
                      child: CustomButton(
                          backgroundColor: AppColors.darkBlue,

                          text: 'save',
                          textColor: AppColors.backgroundgrayColor,
                          widthPercent: 1.1,
                          heightPercent: 18)),
                ),
              )
            ])));
  }
}
