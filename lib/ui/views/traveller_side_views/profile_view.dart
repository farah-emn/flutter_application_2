import 'package:flutter/material.dart';
import 'package:traveling/ui/shared/colors.dart';
import 'package:traveling/ui/shared/utils.dart';
import 'package:traveling/ui/views/traveller_side_views/edit_profile_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: AppColors.StatusBarColor,
        body: SafeArea(
          child: Stack(children: [
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
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Profile',
                      style: TextStyle(
                          fontSize: screenWidth(18),
                          fontWeight: FontWeight.w700,
                          color: AppColors.backgroundgrayColor),
                    )
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Column(
                  children: [
                    const CircleAvatar(
                      radius: 48,
                      backgroundImage:
                          AssetImage('assets/image/png/girlUser1.png'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'User name',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    ),

                    // Center(
                    //   child: Column(
                    //     children: [
                    //       GestureDetector(
                    //         onTap: () {
                    //           Navigator.push(
                    //             context,
                    //             MaterialPageRoute(
                    //               builder: (context) => UserProfileView2(),
                    //             ), // Pass the desired tab index (0, 1, or 2)
                    //           );
                    //         },
                    //         child: Container(
                    //           child: Image(
                    //             image: const AssetImage(
                    //                 'assets/image/png/girlUser1.png'),
                    //             width: screenWidth(5),
                    //           ),
                    //         ),
                    //       ),
                    //       SizedBox(height: screenHeight(80)),
                    //       Text(
                    //         "User name",
                    //         style: TextStyle(
                    //             fontSize: screenWidth(24),
                    //             fontWeight: FontWeight.w500),
                    //       )
                    //     ],
                    //   ),
                    // ),
                    const SizedBox(height: 20),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 7),
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          // Border radius
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: screenHeight(25),
                                ),
                                const Image(
                                  image: AssetImage(
                                      'assets/image/png/date_of_birth_icon.png'),
                                ),
                                SizedBox(
                                  width: 20,
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
                              color: Color.fromARGB(255, 229, 229, 229),
                              thickness: 1,
                              height: 15,
                              indent: 10,
                              endIndent: 10,
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
                                SizedBox(width: 20),
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
                              color: Color.fromARGB(255, 229, 229, 229),
                              thickness: 1,
                              height: 15,
                              indent: 10,
                              endIndent: 10,
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
                                SizedBox(width: 20),
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
                              color: Color.fromARGB(255, 229, 229, 229),
                              thickness: 1,
                              height: 15,
                              indent: 10,
                              endIndent: 10,
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
                                  width: 17,
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
                              color: Color.fromARGB(255, 229, 229, 229),
                              thickness: 1,
                              height: 15,
                              indent: 10,
                              endIndent: 10,
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
                                  width: 20,
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
                    SizedBox(
                      height: screenHeight(30),
                    ),
                    Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          // Border radius
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: screenHeight(25),
                                ),
                                const Image(
                                  image: AssetImage(
                                      'assets/image/png/contact us.png'),
                                ),
                                SizedBox(
                                  width: 20,
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
                              color: Color.fromARGB(255, 229, 229, 229),
                              thickness: 1,
                              height: 10,
                              indent: 10,
                              endIndent: 10,
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
                                  width: 20,
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
                        ))
                  ],
                ),
              ],
            ),
          ]),
        ));
  }
}
