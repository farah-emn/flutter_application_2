// ignore_for_file: deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:traveling/classes/contact_details_passenger_class.dart';
import 'package:traveling/classes/flight_info_class.dart';
import 'package:traveling/classes/passenger_adult_details_class.dart';
import 'package:traveling/ui/views/flight_side_views/flight_booking_view.dart';
import 'package:traveling/ui/views/flight_side_views/flight_contact_passenger_details_view.dart';
import 'package:traveling/ui/views/traveller_side_views/flight_details._view.dart';
import 'package:traveling/ui/views/traveller_side_views/signup_view.dart';

import '../classes/Bookings_class.dart';
import '../classes/flight_details_class.dart';
import '../ui/shared/colors.dart';
import '../ui/views/flight_side_views/flight_flight_details_view.dart';

class ContactDetailsPassengerCard extends StatefulWidget {
  ContactDetailsPassengerCard(
      {super.key,
      required this.ContactDetailsPassengerData,
      required this.itemIndex});
  ContactDetailsPassengerDetailsClass ContactDetailsPassengerData;
  int itemIndex;

  @override
  State<ContactDetailsPassengerCard> createState() =>
      _ContactDetailsPassengerCardState();
}

class _ContactDetailsPassengerCardState
    extends State<ContactDetailsPassengerCard> {
  bool? isChecked = false;
  String? sorteBy;
  User? AirelineCompany;
  final _auth = FirebaseAuth.instance;
  var AirelineCompanyId = '';
  var AirelineCompanyName = '';
  var uid;
  var currentUser;
  Map<dynamic, dynamic> PassengerAdultData = {};
  List<FlightInfoClass> flightsList = [];
  List<FlightInfoClass> filteredFlights = [];
  List<ContactDetailsPassengerDetailsClass> ContactPassengerDetails = [];
  int Adult = 1;
  int Child = 0;

  void initState() {
    super.initState();

    currentUser = _auth.currentUser;
    uid = currentUser?.uid;
    setState(() {
      getData();
      AirelineCompany = _auth.currentUser;
      AirelineCompanyId = AirelineCompany?.uid.toString() ?? '';
    });
    print(';;;');
    print(AirelineCompanyName);
  }

  void getData() async {
    final event =
        await FirebaseDatabase.instance.ref('Airline Company').child(uid).get();
    final AirelineCompanyData = Map<dynamic, dynamic>.from(event.value as Map);
    AirelineCompanyName = AirelineCompanyData['AirlineCompanyName'];
    fetchFlights().then((fetchedFlights) {
      setState(() {});
    });
    print('ccccccccccccccc');
    print(PassengerAdultData.length);
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> fetchFlights() async {
    await FirebaseDatabase.instance
        .reference()
        .child('booking')
        .once()
        .then((DatabaseEvent event) {
      if (event.snapshot.exists) {
        var bookingData =
            Map<dynamic, dynamic>.from(event.snapshot.value as Map);
        bookingData.forEach((key, value) {
          if (key == widget.ContactDetailsPassengerData.bookingId) {
            Adult = bookingData[key]['passengerIds'].length;
            for (var adult in bookingData[key]['passengerIds']) {
              FirebaseDatabase.instance
                  .reference()
                  .child('passenger')
                  .child(adult)
                  .once()
                  .then((DatabaseEvent event) {
                if (event.snapshot.exists) {
                  var passengerData =
                      Map<dynamic, dynamic>.from(event.snapshot.value as Map);
                  passengerData.forEach((key, value) {
                    setState(() {
                      PassengerAdultData[key] = passengerData;
                    });
                  });
                }
              });
            }
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
            InkWell(
                onTap: () {
                  Get.to(FlightContactPassengerDetailsView(
                    ContactPassengerDetails: widget.ContactDetailsPassengerData,
                  ));
                },
                child: Container(
                  padding: EdgeInsetsDirectional.only(
                      start: size.width / 2 + 150, end: 4),
                  child: const Icon(
                    Icons.more_horiz,
                    color: AppColors.Blue,
                  ),
                )),
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
                                '${widget.ContactDetailsPassengerData.firstname}${' '}${widget.ContactDetailsPassengerData.lastname}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 16),
                              ),
                              SizedBox(
                                width: size.width / 4,
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
                                    Icons.boy,
                                    color: AppColors.darkBlue,
                                  ),
                                  const Text(
                                    'Adult:',
                                    style: TextStyle(
                                        color: AppColors.TextBlackColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    Adult.toString() ?? "",
                                    style: const TextStyle(
                                      color: AppColors.TextBlackColor,
                                      fontSize: 12,
                                    ),
                                  ),
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
                                  Text(
                                    Child.toString(),
                                    style: const TextStyle(
                                      color: AppColors.TextBlackColor,
                                      fontSize: 12,
                                    ),
                                  ),
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
                    'more details',
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
