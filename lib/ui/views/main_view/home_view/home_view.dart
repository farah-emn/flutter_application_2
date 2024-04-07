import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:traveling/components/hotelInfoHomeScreenCard.dart';
import 'package:traveling/ui/shared/colors.dart';
import 'package:traveling/ui/shared/custom_widgets/custom_image.dart';
import 'package:traveling/ui/shared/custom_widgets/custom_servicetext.dart';

import 'package:traveling/ui/shared/utils.dart';
import 'package:traveling/ui/views/profile_view/profile_view.dart';

import '../../flights_view/flights_view.dart';
import '../../hotel_views/hotel_payments_view.dart/hotel_payments_view.dart';
import '../../hotel_views/models/hotelInfoModel.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                top: 15,
              ),
              child: Row(
                children: [
                  Text(
                    'Let\’s Explore \nThe World',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: screenWidth(17),
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.notifications,
                    color: AppColors.TextgrayColor,
                    size: 30,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  const CircleAvatar(
                    radius: 20,
                    backgroundImage:
                        AssetImage('assets/image/png/girlUser1.png'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 40,
                bottom: 40,
                left: 15,
                right: 15,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(FlightsView());
                    },
                    child: Column(children: [
                      CustomImage(imagename: 'Flight'),
                      SizedBox(
                        height: screenWidth(30),
                      ),
                      CustomServiceText(text: 'Flight')
                    ]),
                  ),
                  Column(children: [
                    CustomImage(imagename: 'Hotel'),
                    SizedBox(
                      height: screenWidth(30),
                    ),
                    CustomServiceText(text: 'Hotel')
                  ]),
                  Column(children: [
                    CustomImage(imagename: 'Shipping'),
                    SizedBox(
                      height: screenWidth(30),
                    ),
                    CustomServiceText(text: 'Shipping')
                  ]),
                  Column(children: [
                    CustomImage(imagename: 'Taxi'),
                    SizedBox(
                      height: screenWidth(30),
                    ),
                    CustomServiceText(text: 'Taxi')
                  ]),
                ],
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
                  Text(
                    'See All',
                    style:
                        TextStyle(fontSize: 14, color: AppColors.TextgrayColor),
                  ),
                ],
              ),
            ),
            // Padding(
            //   padding: EdgeInsetsDirectional.only(
            //       top: screenWidth(15), bottom: screenWidth(15)),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Container(
            //         width: screenWidth(5),

            //         height: screenHeight(4.5),

            //         // color: Color.fromARGB(255, 207, 205, 205),

            //         decoration: BoxDecoration(
            //           color: Color.fromARGB(255, 207, 205, 205),
            //           borderRadius: BorderRadiusDirectional.only(
            //               bottomEnd: Radius.circular(20),
            //               topEnd: Radius.circular(20)),
            //         ),
            //       ),

            //       // Container(

            //       //  width: screenWidth(2),

            //       //   height: screenHeight(2),

            //       //   decoration: BoxDecoration(

            //       //     borderRadius: BorderRadiusDirectional.circular(20),

            //       //   ),

            //       //   child: CustomImage(imagename: 'imageHotel'),

            //       // ),

            //       Stack(
            //         children: [
            //           CustomImage(imagename: 'imageHotel'),
            //           Padding(
            //             padding: EdgeInsetsDirectional.only(
            //                 start: screenWidth(2.7), top: screenWidth(40)),
            //             child: Icon(
            //               Icons.favorite,
            //               color: AppColors.LightGrayColor,
            //             ),
            //           ),
            //           Padding(
            //             padding: EdgeInsetsDirectional.only(
            //                 top: screenWidth(2.6), start: screenWidth(105)),
            //             child: Container(
            //               height: screenWidth(8),
            //               decoration: BoxDecoration(
            //                   color: Color.fromARGB(229, 249, 249, 249),
            //                   borderRadius:
            //                       BorderRadiusDirectional.circular(10)),
            //               child: Column(
            //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //                   children: [
            //                     Text(
            //                       ' HDB Hotel-Financal District \n',
            //                       style: TextStyle(fontWeight: FontWeight.bold),
            //                     ),
            //                     Text('4 star hotel - king fahd Rd')
            //                   ]),
            //             ),
            //           )
            //         ],
            //       ),

            //       Container(
            //         width: screenWidth(5),

            //         height: screenHeight(4.5),

            //         // color: Color.fromARGB(255, 207, 205, 205),

            //         decoration: BoxDecoration(
            //           color: Color.fromARGB(255, 207, 205, 205),
            //           borderRadius: BorderRadiusDirectional.only(
            //               topStart: Radius.circular(20),
            //               bottomStart: Radius.circular(20)),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            InkWell(
              onTap: () {
                Get.to(
                  const ProfileView(),
                );
              },
              child: Container(
                height: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: hotelInfo.length,
                  itemBuilder: (context, index) => HotelInfoHomeScreenCard(
                    itemIndex: index,
                    hotelInfo: hotelInfo[index],
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 20,
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
                  style:
                      TextStyle(fontSize: 14, color: AppColors.TextgrayColor),
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
          ])
        ],
      ),
    ));
  }
}
