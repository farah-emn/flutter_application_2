// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, sized_box_for_whitespace, unnecessary_null_comparison, library_private_types_in_public_api, deprecated_member_use, unused_local_variable, use_key_in_widget_constructors, must_be_immutable, unused_import, avoid_print
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutter_ocr_sdk/mrz_result.dart';
import 'package:get/get.dart';
import 'package:traveling/cards/hotel_card.dart';
import 'package:traveling/classes/hotel.dart';
import 'package:traveling/classes/hotel_info_class.dart';
import 'package:traveling/controllers/search_oneway_controller.dart';
import 'package:traveling/controllers/search_roundtrip_controller.dart';
import 'package:traveling/ui/shared/colors.dart';
import 'package:traveling/ui/shared/custom_widgets/custom_button.dart';
import 'package:traveling/ui/shared/custom_widgets/custom_textfield2.dart';
import 'package:traveling/ui/shared/custom_widgets/custom_textgray.dart';
import 'package:traveling/ui/shared/custom_widgets/tab_item.dart';
import 'package:traveling/ui/shared/custom_widgets/white_container.dart';
import 'package:traveling/ui/shared/text_size.dart';
import 'package:traveling/ui/shared/utils.dart';
import 'package:traveling/ui/views/traveller_side_views/flights_view/flights_view_oneway.dart';
import 'package:traveling/ui/views/traveller_side_views/hotel_info_view.dart';
import 'package:traveling/ui/views/traveller_side_views/search_flight/DepartureDateDetails.dart';
import 'package:traveling/ui/views/traveller_side_views/search_flight/DepartureDateReturnDateDetails.dart';
import 'package:traveling/ui/views/traveller_side_views/search_flight/list_arrival_city_oneway.dart';
import 'package:traveling/ui/views/traveller_side_views/search_flight/list_arrival_city_round.dart';
import 'package:traveling/ui/views/traveller_side_views/search_flight/list_departure_city_oneway.dart';
import 'package:traveling/ui/views/traveller_side_views/search_flight/list_departure_city_round.dart';
// import 'package:traveling/ui/views/traveller_side_views/traveller_details_view/traveller_details_view2.dart';

class AllHotelView extends StatefulWidget {
  String? DepartureCity;
  String? ArrivalCity;
  AllHotelView({this.DepartureCity, this.ArrivalCity, Key? key})
      : super(key: key);

  @override
  AllHotelViewState createState() => AllHotelViewState();
}

class AllHotelViewState extends State<AllHotelView> {
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
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.lightPurple,
        body: SafeArea(
          child: Stack(children: [
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
            Stack(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Explore',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: AppColors.backgroundgrayColor),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        width: size.width,
                        padding: EdgeInsets.all(10),
                        decoration: decoration.copyWith(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Selected Date',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: AppColors.grayText,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '2024/10',
                                      style: TextStyle(
                                          fontSize: TextSize.header2,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              width: 1,
                              height: 30,
                              color: AppColors.grayText,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Number of Rooms',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: AppColors.grayText,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '2 Rooms - 3 Adults',
                                      style: TextStyle(
                                          fontSize: TextSize.header2,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: size.width / 3 - 15,
                            decoration: decoration.copyWith(),
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.sort,
                                  color: AppColors.gold,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('Sort By'),
                              ],
                            ),
                          ),
                          Container(
                            width: size.width / 3 - 15,
                            decoration: decoration.copyWith(),
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.star_rounded,
                                  color: AppColors.gold,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('Ratings'),
                              ],
                            ),
                          ),
                          Container(
                            width: size.width / 3 - 15,
                            decoration: decoration.copyWith(),
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.filter_alt_rounded,
                                  color: AppColors.gold,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('Filtter'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: hotelInfo.length,
                          itemBuilder: (context, index) => HotelCard(
                            size: size,
                            itemIndex: index,
                            hotelDetails: hotel[index],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
