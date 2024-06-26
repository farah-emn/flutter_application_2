import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:traveling/classes/passenger_adult_details_class.dart';
import 'package:traveling/ui/views/flight_side_views/flight_booking_view.dart';
import 'package:traveling/ui/views/traveller_side_views/flight_details._view.dart';

import '../classes/Bookings_class.dart';
import '../classes/flight_details_class.dart';
import '../ui/shared/colors.dart';
import '../ui/views/flight_side_views/flight_flight_details_view.dart';

class PassengerAdultCard extends StatefulWidget {
  PassengerAdultCard(
      {super.key, required this.PassengerAdultData, required this.itemIndex});
  PassengerAdultDetailsClass PassengerAdultData;
  int itemIndex;

  @override
  State<PassengerAdultCard> createState() => _BookingsCardState();
}

class _BookingsCardState extends State<PassengerAdultCard> {
  @override
  Widget build(BuildContext context) {
    print(';g;gll');
    print(widget.PassengerAdultData.Nationality);

    Size size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {
        Get.to(FlightBookingDetailsView(
          bookingId: '',
        ));
      },
      child: Container(
        margin: const EdgeInsets.only(top: 15, right: 15, left: 15),
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              const SizedBox(
                                width: 50,
                                height: 50,
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundImage: AssetImage(
                                      'assets/image/png/girlUser1.png'),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                '${widget.PassengerAdultData.Firstname}${' '}${widget.PassengerAdultData.Lastname}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 16),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.card_travel,
                                    color: AppColors.darkBlue,
                                  ),
                                  const Text(
                                    'Passpord Number:',
                                    style: TextStyle(
                                        color: AppColors.TextBlackColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  // Text(
                                  //   widget.bookingsModel.audultNumber,
                                  //   style: const TextStyle(
                                  //     color: AppColors.TextBlackColor,
                                  //     fontSize: 12,
                                  //   ),
                                  // ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.boy,
                                    color: AppColors.darkBlue,
                                  ),
                                  const Text(
                                    'Children:',
                                    style: TextStyle(
                                        color: AppColors.TextBlackColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  // Text(
                                  //   widget.bookingsModel.childrenNumber,
                                  //   style: const TextStyle(
                                  //     color: AppColors.TextBlackColor,
                                  //     fontSize: 12,
                                  //   ),
                                  // ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
            Container(
              height: 40,
              width: size.width,
              padding: EdgeInsets.only(right: 15),
              decoration: const BoxDecoration(
                color: AppColors.Blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'More Details',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
