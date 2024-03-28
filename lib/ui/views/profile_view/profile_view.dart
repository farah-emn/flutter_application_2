import 'package:flutter/material.dart';
import 'package:traveling/ui/shared/colors.dart';
import 'package:traveling/ui/shared/utils.dart';
import 'package:traveling/ui/views/profile_view/profile_view2.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

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
                      child: Center(
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => UserProfileView2(),
                                  ), // Pass the desired tab index (0, 1, or 2)
                                );
                              },
                              child: Image(
                                image: const AssetImage(
                                    'assets/image/png/user.png'),
                                width: screenWidth(5),
                              ),
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
                    SizedBox(
                      height: screenWidth(10),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                        start: screenWidth(20),
                        end: screenWidth(20),
                      ),
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            // Border radius
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: screenHeight(25),
                                  ),
                                  const Image(
                                    image: AssetImage(
                                        'assets/image/png/date_of_birth_icon.png'),
                                  ),
                                  SizedBox(
                                    width: screenWidth(20),
                                  ),
                                  Text(
                                    'Bookings',
                                    style: TextStyle(
                                      fontSize: screenWidth(24),
                                      color: AppColors.TextgrayColor,
                                    ),
                                  ),
                                  const Spacer(),
                                  const Image(
                                    image: AssetImage(
                                        'assets/image/png/arrow icon.png'),
                                  )
                                ],
                              ),
                              const Divider(
                                // Add a horizontal line here
                                color: AppColors.LightGrayColor,
                                thickness: 4,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    height: screenHeight(30),
                                  ),
                                  const Image(
                                    image: AssetImage(
                                        'assets/image/png/favorite icon.png'),
                                  ),
                                  SizedBox(
                                    width: screenWidth(20),
                                  ),
                                  Text(
                                    'Favourites',
                                    style: TextStyle(
                                      fontSize: screenWidth(24),
                                      color: AppColors.TextgrayColor,
                                    ),
                                  ),
                                  const Spacer(),
                                  const Image(
                                    image: AssetImage(
                                        'assets/image/png/arrow icon.png'),
                                  )
                                ],
                              ),
                              const Divider(
                                // Add a horizontal line here
                                color: AppColors.LightGrayColor,
                                thickness: 4,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    height: screenHeight(30),
                                  ),
                                  const Image(
                                    image: AssetImage(
                                        'assets/image/png/profile.png'),
                                  ),
                                  SizedBox(
                                    width: screenWidth(20),
                                  ),
                                  Text(
                                    'Profile',
                                    style: TextStyle(
                                      fontSize: screenWidth(24),
                                      color: AppColors.TextgrayColor,
                                    ),
                                  ),
                                  const Spacer(),
                                  const Image(
                                    image: AssetImage(
                                        'assets/image/png/arrow icon.png'),
                                  )
                                ],
                              ),
                              const Divider(
                                // Add a horizontal line here
                                color: AppColors.LightGrayColor,
                                thickness: 4,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    height: screenHeight(30),
                                  ),
                                  const Image(
                                    image: AssetImage(
                                        'assets/image/png/travellers_icon.png'),
                                  ),
                                  SizedBox(
                                    width: screenWidth(20),
                                  ),
                                  Text(
                                    'Travellers',
                                    style: TextStyle(
                                      fontSize: screenWidth(24),
                                      color: AppColors.TextgrayColor,
                                    ),
                                  ),
                                  const Spacer(),
                                  const Image(
                                    image: AssetImage(
                                        'assets/image/png/arrow icon.png'),
                                  )
                                ],
                              ),
                              const Divider(
                                // Add a horizontal line here
                                color: AppColors.LightGrayColor,
                                thickness: 4,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    height: screenHeight(30),
                                  ),
                                  const Image(
                                    image: AssetImage(
                                        'assets/image/png/settings_icon.png'),
                                  ),
                                  SizedBox(
                                    width: screenWidth(20),
                                  ),
                                  Text(
                                    'Settings',
                                    style: TextStyle(
                                      fontSize: screenWidth(24),
                                      color: AppColors.TextgrayColor,
                                    ),
                                  ),
                                  const Spacer(),
                                  const Image(
                                    image: AssetImage(
                                        'assets/image/png/arrow icon.png'),
                                  ),
                                  SizedBox(
                                    height: screenHeight(25),
                                  ),
                                ],
                              ),
                            ],
                          )),
                    ),
                    SizedBox(
                      height: screenHeight(30),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                        start: screenWidth(20),
                        end: screenWidth(20),
                      ),
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            // Border radius
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: screenHeight(25),
                                  ),
                                  const Image(
                                    image: AssetImage(
                                        'assets/image/png/contact us.png'),
                                  ),
                                  SizedBox(
                                    width: screenWidth(20),
                                  ),
                                  Text(
                                    'Contact us',
                                    style: TextStyle(
                                      fontSize: screenWidth(24),
                                      color: AppColors.TextgrayColor,
                                    ),
                                  ),
                                  const Spacer(),
                                  const Image(
                                    image: AssetImage(
                                        'assets/image/png/arrow icon.png'),
                                  )
                                ],
                              ),
                              const Divider(
                                // Add a horizontal line here
                                color: AppColors.LightGrayColor,
                                thickness: 4,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    height: screenHeight(30),
                                  ),
                                  const Image(
                                    image: AssetImage(
                                        'assets/image/png/contact us.png'),
                                  ),
                                  SizedBox(
                                    width: screenWidth(20),
                                  ),
                                  Text(
                                    'Help',
                                    style: TextStyle(
                                      fontSize: screenWidth(24),
                                      color: AppColors.TextgrayColor,
                                    ),
                                  ),
                                  const Spacer(),
                                  const Image(
                                    image: AssetImage(
                                        'assets/image/png/arrow icon.png'),
                                  ),
                                  SizedBox(
                                    height: screenHeight(25),
                                  ),
                                ],
                              ),
                            ],
                          )),
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
