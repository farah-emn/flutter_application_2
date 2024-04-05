// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:traveling/ui/shared/colors.dart';
import 'package:traveling/ui/shared/custom_widgets/custom_button.dart';
import 'package:traveling/ui/shared/utils.dart';

import '../guest_details_view/guest_details_view.dart';

class HotelRoomView extends StatelessWidget {
  const HotelRoomView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Image(
            image: AssetImage('assets/image/png/hotelRoom.png'),
            fit: BoxFit.fill,
            width: screenWidth(1),
          ),
          Padding(
              padding: EdgeInsets.only(top: 20, left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.arrow_back_ios,
                          color: Color.fromARGB(255, 255, 255, 255)),
                      ImageIcon(
                        AssetImage('assets/image/png/favorite.png'),
                        color: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 260,
                  ),
                  Text(
                    'Deluxe Room - 2 Twin Beds ',
                    style: TextStyle(
                      fontSize: screenWidth(21),
                      color: Colors.white,
                    ),
                  ),
                ],
              )),

          Padding(
            padding: EdgeInsetsDirectional.only(top: screenWidth(1.2)),
            child: Image.asset(
              'assets/image/png/background1.png',
              width: screenWidth(1),
              fit: BoxFit.fill,
            ),
          ),
          // SizedBox(
          //   height: 500,
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 370),
            child: ListView(children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Stack(
                      children: [
                        Container(
                          width: size.width / 2.2,
                          height: size.width / 2.2,
                          // margin: EdgeInsets.only(top: 370),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                bottomLeft: Radius.circular(15)),
                            image: DecorationImage(
                                image: AssetImage('assets/image/png/room1.png'),
                                fit: BoxFit.fill),
                          ),
                        ),
                        Container(
                          width: ((size.width / 2.2) / 2) - 5,
                          height: ((size.width / 2.2) / 2) - 5,
                          margin: EdgeInsets.only(
                            left: (size.width / 2.2) + 10,
                            //  top: 370
                          ),
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/image/png/room2.png'),
                                fit: BoxFit.fill),
                          ),
                        ),
                        Container(
                          width: ((size.width / 2.2) / 2) - 5,
                          height: ((size.width / 2.2) / 2) - 5,
                          margin: EdgeInsets.only(
                              left: (size.width / 2.2) + 10,
                              top: ((size.width / 2.2) / 2) + 5),
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/image/png/room3.png'),
                                fit: BoxFit.fill),
                          ),
                        ),
                        Container(
                          width: ((size.width / 2.2) / 2) - 5,
                          height: ((size.width / 2.2) / 2) - 5,
                          margin: EdgeInsets.only(
                            left: (size.width / 2.2) +
                                10 +
                                ((size.width / 2.2) / 2) +
                                5,
                            // top: 370
                          ),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                            ),
                            image: DecorationImage(
                                image: AssetImage('assets/image/png/room4.png'),
                                fit: BoxFit.fill),
                          ),
                        ),
                        Stack(
                          children: [
                            Container(
                              width: ((size.width / 2.2) / 2) - 5,
                              height: ((size.width / 2.2) / 2) - 5,
                              margin: EdgeInsets.only(
                                  left: (size.width / 2.2) +
                                      10 +
                                      ((size.width / 2.2) / 2) +
                                      5,
                                  top: ((size.width / 2.2) / 2) + 5),
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(88, 158, 158, 158),
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(15),
                                ),
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/image/png/room5.png'),
                                    fit: BoxFit.fill),
                              ),
                            ),
                            Container(
                              width: ((size.width / 2.2) / 2) - 5,
                              height: ((size.width / 2.2) / 2) - 5,
                              margin: EdgeInsets.only(
                                  left: (size.width / 2.2) +
                                      10 +
                                      ((size.width / 2.2) / 2) +
                                      5,
                                  top: ((size.width / 2.2) / 2) + 5),
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(178, 33, 33, 33),
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(15),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: (size.width / 2.2) +
                                      10 +
                                      ((size.width / 2.2) / 2) +
                                      25,
                                  top: ((size.width / 2.2) / 2) + 35),
                              child: Text(
                                '+10',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'About',
                        style: TextStyle(
                            fontSize: screenWidth(23),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Padding(
                      padding: EdgeInsetsDirectional.only(
                          top: 15, start: screenWidth(100)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Image(
                                  image: AssetImage(
                                      'assets/image/png/seaview_icon.png')),
                              SizedBox(height: screenHeight(80)),
                              Text(
                                "Partial Sea view",
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Image(
                                  image: AssetImage(
                                      'assets/image/png/icon_50m.png')),
                              SizedBox(height: screenHeight(80)),
                              Text(
                                "50m",
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Image(
                                  image: AssetImage(
                                      'assets/image/png/bed_icon.png')),
                              SizedBox(height: screenHeight(80)),
                              Text(
                                " 2 Twin Beds",
                              )
                            ],
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Amenities',
                        style: TextStyle(
                            fontSize: screenWidth(23),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 10,
                      left: 15,
                    ),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '- ',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'Barbeque',
                                  style: TextStyle(fontSize: screenWidth(26)),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '- ',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'Air Conditioning',
                                  style: TextStyle(fontSize: screenWidth(26)),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '- ',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'Dryer',
                                  style: TextStyle(fontSize: screenWidth(26)),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          width: screenWidth(4),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '- ',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'Laundry',
                                  style: TextStyle(fontSize: screenWidth(26)),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '- ',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'Window Coverings',
                                  style: TextStyle(fontSize: screenWidth(26)),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '- ',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'Refrigerator',
                                  style: TextStyle(fontSize: screenWidth(26)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  //     Expanded(
                  //   child: Align(
                  //     alignment: Alignment.bottomCenter,
                  //     child: ElevatedButton(
                  //       onPressed: () {},
                  //       style: ElevatedButton.styleFrom(
                  //         minimumSize: const Size(double.maxFinite, 50),
                  //         backgroundColor: AppColors.mainColorBlue,
                  //         foregroundColor: Colors.white,
                  //         elevation: 0,
                  //         shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(15),
                  //         ),
                  //       ),
                  //       child: const Text('Select Room'),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ]),
          ),
          // Padding(
          //     padding: EdgeInsetsDirectional.only(
          //         top: screenHeight(2.4), start: screenWidth(15)),
          //     child: Container(
          //       child: Image.asset('assets/image/png/image hotel1.png'),
          //     )),
          // Padding(
          //   padding: EdgeInsetsDirectional.only(
          //       top: screenHeight(2.4), start: screenWidth(1.9)),
          //   child: Image.asset('assets/image/png/small image hotel.png'),
          // ),
          // Padding(
          //   padding: EdgeInsetsDirectional.only(
          //       top: screenHeight(2.4), start: screenWidth(1.35)),
          //   child: Image.asset('assets/image/png/small image hotel.png'),
          // ),
          // Padding(
          //   padding: EdgeInsetsDirectional.only(
          //       top: screenHeight(1.9), start: screenWidth(1.9)),
          //   child: Image.asset('assets/image/png/small image hotel.png'),
          // ),
          // Padding(
          //   padding: EdgeInsetsDirectional.only(
          //       top: screenHeight(1.9), start: screenWidth(1.35)),
          //   child: Image.asset('assets/image/png/small image hotel.png'),
          // ),

          Center(
            child: Padding(
              padding: EdgeInsetsDirectional.only(top: screenHeight(1.16)),
              child: InkWell(
                  onTap: () {
                    Get.to(GuestDetailsView());
                  },
                  child: CustomButton(
                      text: 'save',
                      textColor: AppColors.backgroundgrayColor,
                      widthPercent: 1.1,
                      heightPercent: 18)),
            ),
          )
        ],
      ),
    ));
  }
}
