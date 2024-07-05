import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:traveling/ui/shared/colors.dart';
import 'package:traveling/ui/shared/custom_widgets/custom_button.dart';
import 'package:traveling/ui/shared/custom_widgets/custom_image.dart';
import 'package:traveling/ui/shared/custom_widgets/custom_search_comtainer.dart';
import 'package:traveling/ui/shared/utils.dart';
import 'package:traveling/ui/views/traveller_side_views/search_oneway_view.dart';
import 'package:traveling/ui/views/traveller_side_views/search_round_trip.dart';

class SearchViewOneWay extends StatelessWidget {
  const SearchViewOneWay({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.StatusBarColor,
      body: SafeArea(
        child: Stack(children: [
          Container(
            margin: const EdgeInsets.only(
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
              Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Search',
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
                  Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: 300,
                                height: 50,
                                decoration: const BoxDecoration(
                                    color: AppColors.babyblueColor,
                                    borderRadius: BorderRadiusDirectional.all(
                                      Radius.circular(20),
                                    )),
                                child: InkWell(
                                    onTap: () {
                                      Get.off(const SearchViewRoundTrip());
                                    },
                                    child: Row(
                                      children: [
                                        const SizedBox(
                                          width: 180,
                                        ),
                                        Text(
                                          'Round_trip',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: screenWidth(25)),
                                        ),
                                      ],
                                    )),
                              ),
                              CustomButton(
                          backgroundColor: AppColors.darkBlue,

                                  text: 'One - Way',
                                  textColor: AppColors.backgroundgrayColor,
                                  widthPercent: 2.5,
                                  heightPercent: 18),
                            ],
                          ),
                        ]),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Image(
                        image: AssetImage(
                          'assets/image/png/line2.png',
                        ),
                      ),
                      Column(
                        children: [
                          const CustomSearchContainer(
                            widthPercent: 1.2,
                            heightPercent: 7,
                            boldtext: 'CAI - Cairo',
                            icon: Icons.flight_takeoff_sharp,
                            text: 'From',
                            IconColor: AppColors.pinkColor,
                          ),
                          SizedBox(
                            height: screenWidth(20),
                          ),
                          const CustomSearchContainer(
                              widthPercent: 1.2,
                              heightPercent: 7,
                              boldtext: 'RUH - Riyadh',
                              icon: Icons.flight_land,
                              text: 'To',
                              IconColor: AppColors.pinkColor),
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                      top: 20,
                      start: screenWidth(18),
                      end: screenWidth(15),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomSearchContainer(
                            widthPercent: 2.5,
                            heightPercent: 7,
                            boldtext: '22. Dec , 2023',
                            icon: Icons.calendar_month_outlined,
                            text: 'Depature date',
                            IconColor: AppColors.IconBlueColor),
                        CustomSearchContainer(
                          widthPercent: 2.5,
                          heightPercent: 7,
                          boldtext: 'rutern date',
                          icon: Icons.calendar_month_outlined,
                          text: '',
                          IconColor: AppColors.IconBlueColor,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                      start: screenWidth(18),
                      end: screenWidth(15),
                      top: screenWidth(18),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomSearchContainer(
                          widthPercent: 2.5,
                          heightPercent: 7,
                          boldtext: '1 Adults ',
                          icon: Icons.groups,
                          text: 'passengers',
                          IconColor: AppColors.IconPurpleColor,
                        ),
                        CustomSearchContainer(
                          widthPercent: 2.5,
                          heightPercent: 7,
                          boldtext: '0 Childern',
                          icon: Icons.groups,
                          text: 'passengers',
                          IconColor: AppColors.IconPurpleColor,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenWidth(2),
                  ),
                  InkWell(
                    child: CustomButton(
                          backgroundColor: AppColors.darkBlue,

                        text: 'Search',
                        textColor: AppColors.backgroundgrayColor,
                        widthPercent: 1.1,
                        heightPercent: 15),
                  )
                ],
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
