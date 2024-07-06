// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, sized_box_for_whitespace, unnecessary_null_comparison, library_private_types_in_public_api, deprecated_member_use, unused_local_variable, use_key_in_widget_constructors, must_be_immutable, unused_import, avoid_print
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_ocr_sdk/mrz_result.dart';
import 'package:get/get.dart';
import 'package:traveling/controllers/search_oneway_controller.dart';
import 'package:traveling/ui/shared/colors.dart';
import 'package:traveling/ui/shared/custom_widgets/custom_button.dart';
import 'package:traveling/ui/shared/custom_widgets/custom_textgray.dart';
import 'package:traveling/ui/shared/utils.dart';
import 'package:traveling/ui/views/traveller_side_views/flights_view/flights_view_oneway.dart';
import 'package:traveling/ui/views/traveller_side_views/search_oneway_view/DepartureDateDetails.dart';
import 'package:traveling/ui/views/traveller_side_views/search_oneway_view/list_arrival_city_oneway.dart';
import 'package:traveling/ui/views/traveller_side_views/search_oneway_view/list_departure_city_oneway.dart';
import 'package:traveling/ui/views/traveller_side_views/search_roundtrip_view/search_round_view.dart';
// import 'package:traveling/ui/views/traveller_side_views/traveller_details_view/traveller_details_view2.dart';

class SearchViewOneWay extends StatefulWidget {
  String? DepartureCity;
  String? ArrivalCity;
  SearchViewOneWay({this.DepartureCity, this.ArrivalCity, Key? key})
      : super(key: key);

  @override
  SearchViewOneWayState createState() => SearchViewOneWayState();
}

class SearchViewOneWayState extends State<SearchViewOneWay> {
  final TextEditingController dateController = TextEditingController();
  void _handleDateSelection(String dateText) {
    controller.updateSelectedDate();
    dateController.text = dateText;
  }

  final SearchViewOneWayController controller =
      Get.put(SearchViewOneWayController());

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
    print(';;;;;;;;;;;');
  }

  @override
  Widget build(BuildContext context) {
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
                                      Get.off(SearchViewRoundTrip(
                                        DepartureCity: '',
                                        ArrivalCity: '',
                                      ));
                                    },
                                    child: Row(
                                      children: [
                                        SizedBox(
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
                                text: 'One - Way',
                                textColor: AppColors.backgroundgrayColor,
                                widthPercent: 2.5,
                                heightPercent: 18,
                                backgroundColor: AppColors.mainColorBlue,
                              ),
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
                                      builder: (context) => ListDepartureCity(),
                                    ),
                                  );
                                  if (result != null) {
                                    setState(() {
                                      if (result != null) {
                                        setState(() {
                                          if (widget.ArrivalCity != '') {
                                            if (result['DepartureCity'] ==
                                                widget.ArrivalCity) {
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
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
                                          padding:
                                              EdgeInsets.only(left: 18, top: 8),
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
                                          ListCityArrivalOneWay(),
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
                                          padding:
                                              EdgeInsets.only(left: 18, top: 8),
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
                    padding: EdgeInsets.only(right: 20, left: 20, top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DepartureDateDetails(
                          onDateSelected: _handleDateSelection,
                          Departure_date: controller.departureDate,
                          datecontroller: dateController,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(SearchViewRoundTrip(
                                DepartureCity: '', ArrivalCity: ''));
                          },
                          child: Container(
                              padding: EdgeInsets.only(right: 10, left: 10),
                              width: 180,
                              height: 58,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.calendar_month_outlined,
                                    color: AppColors.LightBlueColor,
                                  ),
                                  SizedBox(
                                    width: screenWidth(30),
                                  ),
                                  Text(
                                    'Add rutern',
                                    style: TextStyle(
                                        color: AppColors.mainColorBlue,
                                        fontSize: 16),
                                  ),
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                      start: screenWidth(15),
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
                                        GetBuilder<SearchViewOneWayController>(
                                          init: SearchViewOneWayController(),
                                          builder: (controller) {
                                            return Text(
                                              '${controller.Adultcounter} Adult',
                                              style: TextStyle(
                                                  fontSize: screenWidth(25),
                                                  fontWeight: FontWeight.w500),
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
                                                    color:
                                                        AppColors.TextgrayColor,
                                                    size: 20),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  controller.decrementAdult();
                                                },
                                                child: Icon(
                                                    Icons.arrow_drop_down_sharp,
                                                    color:
                                                        AppColors.TextgrayColor,
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
                                  width: screenWidth(50),
                                ),
                                Column(
                                  children: [
                                    CustomTextGray(mainText: 'passengers'),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 5,
                                        ),
                                        GetBuilder<SearchViewOneWayController>(
                                          init: SearchViewOneWayController(),
                                          builder: (controller) {
                                            return Text(
                                              '${controller.Childcounter} Children',
                                              style: TextStyle(
                                                  fontSize: screenWidth(25),
                                                  fontWeight: FontWeight.w500),
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
                                                    color:
                                                        AppColors.TextgrayColor,
                                                    size: 20),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  controller.decrementChild();
                                                },
                                                child: Icon(
                                                    Icons.arrow_drop_down_sharp,
                                                    color:
                                                        AppColors.TextgrayColor,
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
                    height: 30,
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
            ],
          ),
        ]),
      ),
    );
  }
}
