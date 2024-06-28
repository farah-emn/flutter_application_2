import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:traveling/cards/hotel_info_home_view_card.dart';
import 'package:traveling/ui/shared/colors.dart';
import 'package:traveling/ui/shared/custom_widgets/custom_image.dart';
import 'package:traveling/ui/shared/custom_widgets/custom_servicetext.dart';

import 'package:traveling/ui/shared/utils.dart';
import 'package:traveling/ui/views/first_view.dart';
import 'package:traveling/ui/views/traveller_side_views/menu_view.dart';
import 'package:traveling/ui/views/traveller_side_views/welcome_view.dart';

import 'flights_view.dart';
import 'hotel_payments_view.dart';
import '../../../classes/hotel_info_class.dart';

late User loggedinUser;

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    getCurrentUser();
    // test();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedinUser = user;
      }
      if (_auth.currentUser == null) {
        Get.offAll(const FirstView());
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppColors.IconBlueColor,
            elevation: 0,
            pinned: true,
            expandedHeight: 335,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                  color: AppColors.StatusBarColor,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 110,
                        ),
                        Stack(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.cloud,
                                  color: Color.fromARGB(76, 249, 249, 249),
                                  size: 60,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 40,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Let's Explore",
                                      style: TextStyle(
                                          color: AppColors.backgroundgrayColor,
                                          fontSize: 30,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.cloud,
                                      color: Color.fromARGB(76, 249, 249, 249),
                                      size: 50,
                                    ),
                                    SizedBox(
                                      width: 70,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "The World!",
                                      style: TextStyle(
                                          color: AppColors.backgroundgrayColor,
                                          fontSize: 30,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0.0),
              child: Container(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                decoration: const BoxDecoration(
                  color: AppColors.backgroundgrayColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                // child: ,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(FlightsView());
                      },
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: AppColors.LightBlueColor),
                            child: const Icon(
                              Icons.flight,
                              color: AppColors.BlueText,
                              size: 30,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Flight',
                            style: TextStyle(color: AppColors.BlueText),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: AppColors.LightBlueColor),
                          child: const Icon(
                            Icons.hotel,
                            color: AppColors.BlueText,
                            size: 30,
                          ),
                        ),
                        SizedBox(
                          height: screenWidth(30),
                        ),
                        const Text(
                          'Hotel',
                          style: TextStyle(color: AppColors.BlueText),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: AppColors.LightBlueColor),
                          child: const Icon(
                            Icons.local_taxi,
                            color: AppColors.BlueText,
                            size: 30,
                          ),
                        ),
                        SizedBox(
                          height: screenWidth(30),
                        ),
                        const Text(
                          'Car',
                          style: TextStyle(color: AppColors.BlueText),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            leadingWidth: MediaQuery.of(context).size.width,
            toolbarHeight: 180,
            leading: const Padding(
              padding: EdgeInsets.only(
                left: 15,
                right: 15,
                top: 15,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 50,
                            height: 50,
                            child: CircleAvatar(
                              radius: 20,
                              backgroundImage:
                                  AssetImage('assets/image/png/girlUser1.png'),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'User Name',
                                style: TextStyle(
                                    color: AppColors.backgroundgrayColor,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                'Username@gmail.com',
                                style:
                                    TextStyle(color: AppColors.LightGrayColor),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Icon(
                        Icons.notifications,
                        color: AppColors.backgroundgrayColor,
                        size: 30,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: MediaQuery.sizeOf(context).height - 130,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 40,
                      left: 15,
                      right: 15,
                    ),
                    child: Container(
                        // decoration: BoxDecoration(boxShadow: List),

                        ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Top international hotels ',
                            style: TextStyle(
                                fontSize: screenWidth(20),
                                fontWeight: FontWeight.w700)),
                        // CustomTextGray(mainText: 'See All',)
                        const Text(
                          'See All',
                          style: TextStyle(
                              fontSize: 14, color: AppColors.TextgrayColor),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(
                        const MenuView(),
                      );
                    },
                    child: Container(
                      height: 250,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: hotelInfo.length,
                        itemBuilder: (context, index) => HotelInfoHomeViewCard(
                          itemIndex: index,
                          hotelInfo: hotelInfo[index],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Offers',
                          style: TextStyle(
                              fontSize: screenWidth(20),
                              fontWeight: FontWeight.w700)),
                      SizedBox(
                        width: screenWidth(2),
                      ),
                      Text(
                        'See All',
                        style: TextStyle(
                            fontSize: 14, color: AppColors.TextgrayColor),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenWidth(20),
                  ),
                  Container(
                    width: screenWidth(1.1),
                    height: screenWidth(2.7),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 207, 205, 205),
                        borderRadius: BorderRadius.circular(20)),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       backgroundColor: AppColors.StatusBarColor,
  //       body: SafeArea(
  //         child: Stack(
  //           children: [
  //             Padding(
  //               padding: const EdgeInsets.only(
  //                 top: 250,
  //               ),
  //               child: Container(
  //                 decoration: const BoxDecoration(
  //                   image: DecorationImage(
  //                       image: AssetImage('assets/image/png/background1.png'),
  //                       fit: BoxFit.fill),
  //                 ),
  //               ),
  //             ),
  //             const Padding(
  //               padding: EdgeInsets.only(right: 20, top: 100),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.end,
  //                 children: [
  //                   Icon(
  //                     Icons.cloud,
  //                     color: Color.fromARGB(92, 249, 249, 249),
  //                     size: 60,
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             const Padding(
  //               padding: EdgeInsets.only(right: 80, top: 140),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.end,
  //                 children: [
  //                   Icon(
  //                     Icons.cloud,
  //                     color: Color.fromARGB(92, 249, 249, 249),
  //                     size: 50,
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             ListView(
  //               children: [
  //                 Column(
  //                     crossAxisAlignment: CrossAxisAlignment.center,
  //                     children: [
  //                       const Padding(
  //                         padding: EdgeInsets.only(
  //                           left: 15,
  //                           right: 15,
  //                           top: 20,
  //                         ),
  //                         child: Row(
  //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                           children: [
  //                             Row(
  //                               children: [
  //                                 SizedBox(
  //                                   width: 50,
  //                                   height: 50,
  //                                   child: CircleAvatar(
  //                                     radius: 20,
  //                                     backgroundImage: AssetImage(
  //                                         'assets/image/png/girlUser1.png'),
  //                                   ),
  //                                 ),
  //                                 SizedBox(
  //                                   width: 10,
  //                                 ),
  //                                 Column(
  //                                   crossAxisAlignment:
  //                                       CrossAxisAlignment.start,
  //                                   children: [
  //                                     Text(
  //                                       'User Name',
  //                                       style: TextStyle(
  //                                           color:
  //                                               AppColors.backgroundgrayColor,
  //                                           fontSize: 17,
  //                                           fontWeight: FontWeight.w500),
  //                                     ),
  //                                     Text(
  //                                       'Username@gmail.com',
  //                                       style: TextStyle(
  //                                           color: AppColors.LightGrayColor),
  //                                     ),
  //                                   ],
  //                                 ),
  //                               ],
  //                             ),
  //                             Icon(
  //                               Icons.notifications,
  //                               color: AppColors.backgroundgrayColor,
  //                               size: 30,
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //                       const Padding(
  //                         padding: EdgeInsets.only(left: 15, top: 70),
  //                         child: Row(
  //                           children: [
  //                             Text(
  //                               "Let's Explore",
  //                               style: TextStyle(
  //                                   color: AppColors.backgroundgrayColor,
  //                                   fontSize: 30,
  //                                   fontWeight: FontWeight.w500),
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //                       const Padding(
  //                         padding: EdgeInsets.only(
  //                           left: 15,
  //                         ),
  //                         child: Row(
  //                           children: [
  //                             Text(
  //                               "The World!",
  //                               style: TextStyle(
  //                                   color: AppColors.backgroundgrayColor,
  //                                   fontSize: 30,
  //                                   fontWeight: FontWeight.w500),
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //                       Padding(
  //                         padding: const EdgeInsets.only(
  //                           top: 100,
  //                           bottom: 40,
  //                           left: 15,
  //                           right: 15,
  //                         ),
  //                         child: Container(
  //                           // decoration: BoxDecoration(boxShadow: List),
  //                           child: Row(
  //                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                             children: [
  //                               InkWell(
  //                                 onTap: () {
  //                                   Get.to(FlightsView());
  //                                 },
  //                                 child: Column(
  //                                   children: [
  //                                     const Icon(
  //                                       Icons.flight,
  //                                       color: AppColors.BlueText,
  //                                       size: 30,
  //                                     ),
  //                                     SizedBox(
  //                                       height: screenWidth(30),
  //                                     ),
  //                                     const Text(
  //                                       'Flight',
  //                                       style:
  //                                           TextStyle(color: AppColors.BlueText),
  //                                     ),
  //                                   ],
  //                                 ),
  //                               ),
  //                               Column(
  //                                 children: [
  //                                   const Icon(
  //                                     Icons.hotel,
  //                                     color: AppColors.BlueText,
  //                                     size: 30,
  //                                   ),
  //                                   SizedBox(
  //                                     height: screenWidth(30),
  //                                   ),
  //                                   const Text(
  //                                     'Hotel',
  //                                     style: TextStyle(color: AppColors.BlueText),
  //                                   ),
  //                                 ],
  //                               ),
  //                               Column(
  //                                 children: [
  //                                   const Icon(
  //                                     Icons.local_taxi,
  //                                     color: AppColors.BlueText,
  //                                     size: 30,
  //                                   ),
  //                                   SizedBox(
  //                                     height: screenWidth(30),
  //                                   ),
  //                                   const Text(
  //                                     'Car',
  //                                     style: TextStyle(color: AppColors.BlueText),
  //                                   ),
  //                                 ],
  //                               ),
  //                             ],
  //                           ),
  //                         ),
  //                       ),
  //                       Padding(
  //                         padding: EdgeInsets.symmetric(horizontal: 15),
  //                         child: Row(
  //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                           children: [
  //                             Text('Top international hotels ',
  //                                 style: TextStyle(
  //                                     fontSize: screenWidth(20),
  //                                     fontWeight: FontWeight.w700)),
  //                             // CustomTextGray(mainText: 'See All',)
  //                             const Text(
  //                               'See All',
  //                               style: TextStyle(
  //                                   fontSize: 14,
  //                                   color: AppColors.TextgrayColor),
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //                       InkWell(
  //                         onTap: () {
  //                           Get.to(
  //                             MenuView(userName),
  //                           );
  //                         },
  //                         child: Container(
  //                           height: 250,
  //                           child: ListView.builder(
  //                             scrollDirection: Axis.horizontal,
  //                             shrinkWrap: true,
  //                             itemCount: hotelInfo.length,
  //                             itemBuilder: (context, index) =>
  //                                 HotelInfoHomeViewCard(
  //                               itemIndex: index,
  //                               hotelInfo: hotelInfo[index],
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                       const SizedBox(
  //                         height: 20,
  //                       ),
  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                         children: [
  //                           Text('Offers',
  //                               style: TextStyle(
  //                                   fontSize: screenWidth(20),
  //                                   fontWeight: FontWeight.w700)),
  //                           SizedBox(
  //                             width: screenWidth(2),
  //                           ),
  //                           Text(
  //                             'See All',
  //                             style: TextStyle(
  //                                 fontSize: 14, color: AppColors.TextgrayColor),
  //                           ),
  //                         ],
  //                       ),
  //                       SizedBox(
  //                         height: screenWidth(20),
  //                       ),
  //                       Container(
  //                         width: screenWidth(1.1),
  //                         height: screenWidth(2.7),
  //                         decoration: BoxDecoration(
  //                             color: Color.fromARGB(255, 207, 205, 205),
  //                             borderRadius: BorderRadius.circular(20)),
  //                       )
  //                     ])
  //               ],
  //             ),
  //           ],
  //         ),
  // ));
  // }
}
