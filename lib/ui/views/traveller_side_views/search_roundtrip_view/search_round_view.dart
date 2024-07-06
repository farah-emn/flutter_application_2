// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, sized_box_for_whitespace, unnecessary_null_comparison, library_private_types_in_public_api, deprecated_member_use, unused_local_variable, use_key_in_widget_constructors, must_be_immutable, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:traveling/controllers/search_roundtrip_controller.dart';
import 'package:traveling/ui/shared/colors.dart';
import 'package:traveling/ui/shared/custom_widgets/custom_button.dart';
import 'package:traveling/ui/shared/custom_widgets/custom_textgray.dart';
import 'package:traveling/ui/shared/utils.dart';
import 'package:traveling/ui/views/traveller_side_views/search_oneway_view/search_oneway_view.dart';
import 'package:traveling/ui/views/traveller_side_views/search_roundtrip_view/DepartureDateReturnDateDetails.dart';
import 'package:traveling/ui/views/traveller_side_views/search_roundtrip_view/list_arrival_city_round.dart';
import 'package:traveling/ui/views/traveller_side_views/search_roundtrip_view/list_departure_city_round.dart';

class SearchViewRoundTrip extends StatefulWidget {
  String? DepartureCity;
  String? ArrivalCity;

  SearchViewRoundTrip({
    this.DepartureCity,
    this.ArrivalCity,
  });

  @override
  _SearchViewRoundTripState createState() => _SearchViewRoundTripState();
}

class _SearchViewRoundTripState extends State<SearchViewRoundTrip> {
  final SearchViewRoundTripController controller =
      Get.put(SearchViewRoundTripController());

  final TextEditingController dateController = TextEditingController();
  final TextEditingController returnDateController = TextEditingController();
  void onDepartureCitySelected(String selectedCity) {
    controller.setDepartureCity(widget.ArrivalCity ?? '');
  }

  void onArrivalCitySelected(String selectedCity) {
    controller.setArrivalCity(widget.DepartureCity ?? '');
  }

  void _searchForFlights() async {
    if (widget.DepartureCity != null) {
      controller.setDepartureCity(widget.DepartureCity!);
    }
    if (widget.ArrivalCity != null) {
      controller.setArrivalCity(widget.ArrivalCity!);
    }
    controller.searchForFlights();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _handleDateSelection(String dateText) {
    controller.updateSelectedDate();
    dateController.text = dateText;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: ListView(children: [
      Container(
          color: AppColors.LightBlueColor,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(
                    top: screenWidth(30),
                    start: screenWidth(20),
                    end: screenWidth(3),
                    bottom: screenWidth(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: screenWidth(10),
                      height: screenWidth(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: AppColors.backgroundgrayColor),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.mainColorBlue,
                      ),
                    ),
                    Text(
                      'Search Flights',
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
                height: screenHeight(1.2),
                decoration: BoxDecoration(
                  color: AppColors.backgroundgrayColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.only(
                              top: screenWidth(15), end: screenWidth(3)),
                          child: Container(
                            width: screenWidth(2.5),
                            height: screenHeight(18),
                            decoration: BoxDecoration(
                                color: AppColors.babyblueColor,
                                borderRadius: BorderRadiusDirectional.only(
                                  topStart: Radius.circular(20),
                                  bottomStart: Radius.circular(20),
                                )),
                            child: InkWell(
                              onTap: () {
                                Get.off(SearchViewOneWay(
                                  DepartureCity: '',
                                  ArrivalCity: '',
                                ));
                              },
                              child: Center(
                                child: Text(
                                  'One - Way',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: screenWidth(25)),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.only(
                              top: screenWidth(15), start: screenWidth(2.7)),
                          child: CustomButton(
                              text: 'Round_trip',
                              textColor: AppColors.backgroundgrayColor,
                              backgroundColor: AppColors.mainColorBlue,
                              widthPercent: 2.5,
                              heightPercent: 18),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenWidth(7),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image(
                          image: AssetImage(
                            'assets/image/png/line2.png',
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              width: screenWidth(1.2),
                              height: screenHeight(16),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: Colors.white,
                                    onPrimary: Colors.black, // Text color

                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),

                                    side: BorderSide(
                                        color: Colors.transparent, width: 0),
                                  ),
                                  onPressed: () async {
                                    final result = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ListDepartureCityRound(),
                                      ),
                                    );

                                    if (result != null) {
                                      setState(() {
                                        if (widget.ArrivalCity != '') {
                                          if (result['DepartureCity'] ==
                                              widget.ArrivalCity) {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text(
                                                      'Invalid City Selection'),
                                                  content: Text(
                                                      'Arrival city cannot be the same as the departure city.'),
                                                );
                                              },
                                            );
                                          } else {
                                            widget.DepartureCity =
                                                result['DepartureCity'];
                                          }
                                        } else {
                                          widget.DepartureCity =
                                              result['DepartureCity'];
                                        }
                                      });
                                    }
                                  },
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: [
                                        Icon(Icons.flight_takeoff,
                                            color: AppColors.pinkColor2),
                                        Column(children: [
                                          SizedBox(
                                            height: 6,
                                          ),
                                          Text(
                                            'From',
                                            style: TextStyle(
                                                color: AppColors.TextgrayColor),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 18, top: 8),
                                            child: Text(
                                              widget.DepartureCity ?? '',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          )
                                        ]),
                                      ],
                                    ),
                                  )),
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            Container(
                              width: screenWidth(1.2),
                              height: screenHeight(16),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: Colors.white,
                                    onPrimary: Colors.black, // Text color

                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),

                                    side: BorderSide(
                                        color: Colors.transparent, width: 0),
                                  ),
                                  onPressed: () async {
                                    final result = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ListCityArrivalRound(),
                                      ),
                                    );
                                    if (result != null) {
                                      setState(() {
                                        if (widget.DepartureCity != '') {
                                          if (result['ArrivalCity'] ==
                                              widget.DepartureCity) {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text(
                                                      'Invalid City Selection'),
                                                  content: Text(
                                                      'Arrival city cannot be the same as the departure city.'),
                                                );
                                              },
                                            );
                                          } else {
                                            widget.ArrivalCity =
                                                result['ArrivalCity'];
                                          }
                                        } else {
                                          widget.ArrivalCity =
                                              result['ArrivalCity'];
                                        }
                                      });
                                    }
                                  },
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: [
                                        Icon(Icons.flight_takeoff,
                                            color: AppColors.pinkColor2),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(children: [
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            'To',
                                            style: TextStyle(
                                                color: AppColors.TextgrayColor),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 18, top: 8),
                                            child: Text(
                                              widget.ArrivalCity ?? '',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          )
                                        ]),
                                      ],
                                    ),
                                  )),
                            ),
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                        top: 20,
                        start: screenWidth(20),
                        end: screenWidth(15),
                      ),
                      child: DepartureDateReturnDateDetails(
                          onDateSelected: _handleDateSelection,
                          Departure_date: controller.departureDate,
                          Return_date: controller.ReturnDate,
                          datecontroller: dateController,
                          returnDateController: returnDateController),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                        start: screenWidth(18),
                        end: screenWidth(15),
                        top: screenWidth(18),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 160,
                            height: 70,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: EdgeInsetsDirectional.only(
                                top: screenWidth(50),
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.group,
                                      color: AppColors.IconPurpleColor),
                                  SizedBox(
                                    width: screenWidth(30),
                                  ),
                                  Column(
                                    children: [
                                      CustomTextGray(mainText: 'passengers'),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 5,
                                          ),
                                          GetBuilder<
                                              SearchViewRoundTripController>(
                                            init:
                                                SearchViewRoundTripController(),
                                            builder: (controller) {
                                              return Text(
                                                '${controller.Adultcounter} Adult',
                                                style: TextStyle(
                                                    fontSize: screenWidth(25),
                                                    fontWeight:
                                                        FontWeight.w500),
                                              );
                                            },
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 15),
                                            child: Column(
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    controller.incrementAdult();
                                                  },
                                                  child: Icon(
                                                      Icons.arrow_drop_up_sharp,
                                                      color: AppColors
                                                          .TextgrayColor,
                                                      size: 20),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    controller.decrementAdult();
                                                  },
                                                  child: Icon(
                                                      Icons
                                                          .arrow_drop_down_sharp,
                                                      color: AppColors
                                                          .TextgrayColor,
                                                      size: 20),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 160,
                            height: 70,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: EdgeInsetsDirectional.only(
                                top: screenWidth(50),
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.group,
                                      color: AppColors.IconPurpleColor),
                                  SizedBox(
                                    width: screenWidth(30),
                                  ),
                                  Column(
                                    children: [
                                      CustomTextGray(mainText: 'passengers'),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 5,
                                          ),
                                          GetBuilder<
                                              SearchViewRoundTripController>(
                                            init:
                                                SearchViewRoundTripController(),
                                            builder: (controller) {
                                              return Text(
                                                '${controller.Childcounter} Children',
                                                style: TextStyle(
                                                    fontSize: screenWidth(25),
                                                    fontWeight:
                                                        FontWeight.w500),
                                              );
                                            },
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 15),
                                            child: Column(
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    controller.incrementChild();
                                                  },
                                                  child: Icon(
                                                      Icons.arrow_drop_up_sharp,
                                                      color: AppColors
                                                          .TextgrayColor,
                                                      size: 20),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    controller.decrementChild();
                                                  },
                                                  child: Icon(
                                                      Icons
                                                          .arrow_drop_down_sharp,
                                                      color: AppColors
                                                          .TextgrayColor,
                                                      size: 20),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: screenWidth(2),
                    ),
                    InkWell(
                      onTap: _searchForFlights,
                      child: CustomButton(
                          text: 'Search',
                          textColor: AppColors.backgroundgrayColor,
                          backgroundColor: AppColors.mainColorBlue,
                          widthPercent: 1.1,
                          heightPercent: 15),
                    )
                  ],
                ),
              ),
            ],
          ))
    ])));
  }
}
