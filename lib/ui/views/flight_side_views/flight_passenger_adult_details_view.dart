// ignore_for_file: deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:traveling/classes/contact_details_passenger_class.dart';
import 'package:traveling/classes/flight_info_class.dart';
import 'package:traveling/ui/views/flight_side_views/flight_booking_view.dart';
import '../../shared/colors.dart';
import '../../shared/custom_widgets/custom_textfield2.dart';

class FlightPassengerAdultDetailsView extends StatefulWidget {
  FlightPassengerAdultDetailsView({super.key});
  @override
  State<FlightPassengerAdultDetailsView> createState() =>
      _FlightPassengerAdultDetailsViewState();
}

class _FlightPassengerAdultDetailsViewState
    extends State<FlightPassengerAdultDetailsView> {
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

  void initState() {
    super.initState();

    currentUser = _auth.currentUser;
    uid = currentUser?.uid;
    setState(() {
      // getData();
      AirelineCompany = _auth.currentUser;
      AirelineCompanyId = AirelineCompany?.uid.toString() ?? '';
    });
    print(';;;');
    print(AirelineCompanyName);
  }

  // void getData() async {
  //   final event =
  //       await FirebaseDatabase.instance.ref('Airline Company').child(uid).get();
  //   final AirelineCompanyData = Map<dynamic, dynamic>.from(event.value as Map);
  //   AirelineCompanyName = AirelineCompanyData['AirlineCompanyName'];
  //   fetchFlights().then((fetchedFlights) {
  //     setState(() {});
  //   });
  //   print('ccccccccccccccc');
  //   print(PassengerAdultData.length);
  // }

  @override
  void dispose() {
    super.dispose();
  }

  // Future<void> fetchFlights() async {
  //   await FirebaseDatabase.instance
  //       .reference()
  //       .child('booking')
  //       .once()
  //       .then((DatabaseEvent event) {
  //     if (event.snapshot.exists) {
  //       var bookingData =
  //           Map<dynamic, dynamic>.from(event.snapshot.value as Map);
  //       bookingData.forEach((key, value) {
  //         if (key == widget.ContactDetailsPassengerData.bookingId) {
  //           Adult = bookingData[key]['passengerIds'].length;
  //           for (var i in bookingData[key]['passengerIds']) {
  //             FirebaseDatabase.instance
  //                 .reference()
  //                 .child('passenger')
  //                 .child(i)
  //                 .once()
  //                 .then((DatabaseEvent event) {
  //               if (event.snapshot.exists) {
  //                 var passengerData =
  //                     Map<dynamic, dynamic>.from(event.snapshot.value as Map);
  //                 passengerData.forEach((key, value) {
  //                   setState(() {
  //                     PassengerAdultData[key] = passengerData;
  //                   });
  //                 });
  //               }
  //             });
  //           }
  //         }
  //       });
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.StatusBarColor,
        body: SafeArea(
          child: Stack(children: [
            const Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Booking details',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppColors.backgroundgrayColor),
                  ),
                  SizedBox(),
                ],
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
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 15, right: 15),
                      child: ListView(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Contact Details',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 15,
                                ),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'booking number',
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: AppColors.grayText,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 45,
                                  width: size.width - 50,
                                  child: TextField(
                                    readOnly: true,
                                    // controller: TextEditingController(
                                    //     text: widget
                                    //         .ContactPassengerDetails.bookingId),
                                    decoration: textFielDecoratiom.copyWith(
                                        fillColor: Colors.white,
                                        prefixIcon: const Icon(
                                            Icons.flight_takeoff_outlined)),
                                    onChanged: (value) {},
                                  ),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                const Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'booking date',
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: AppColors.grayText,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 45,
                                  width: size.width - 50,
                                  child: TextField(
                                    keyboardType: TextInputType.phone,
                                    decoration: textFielDecoratiom.copyWith(
                                        fillColor: Colors.white,
                                        prefixIcon: const Icon(
                                            Icons.flight_takeoff_outlined)),
                                    onChanged: (value) {},
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          // const SizedBox(
                          //   height: 20,
                          // ),
                          const Text(
                            'Contact details',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 15,
                                ),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Email',
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: AppColors.grayText,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 45,
                                  width: size.width - 50,
                                  child: TextField(
                                    readOnly:
                                        true, // This makes the TextField read-only
                                    // controller: TextEditingController(
                                    //     text: widget
                                    //         .ContactPassengerDetails.Email),
                                    keyboardType: TextInputType.phone,
                                    decoration: textFielDecoratiom.copyWith(
                                        fillColor: Colors.white,
                                        prefixIcon: const Icon(
                                            Icons.flight_takeoff_outlined)),
                                    onChanged: (value) {},
                                  ),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                const Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'First name',
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: AppColors.grayText,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 45,
                                  width: size.width - 50,
                                  child: TextField(
                                    readOnly: true,
                                    // controller: TextEditingController(
                                    //     text: widget
                                    //         .ContactPassengerDetails.firstname),
                                    decoration: textFielDecoratiom.copyWith(
                                        fillColor: Colors.white,
                                        prefixIcon:
                                            const Icon(Icons.flight_land)),
                                    onChanged: (value) {},
                                  ),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Last name',
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: AppColors.grayText,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 45,
                                  width: size.width - 50,
                                  child: TextField(
                                    readOnly: true,
                                    // controller: TextEditingController(
                                    //     text: widget
                                    //         .ContactPassengerDetails.lastname),
                                    keyboardType: TextInputType.phone,
                                    decoration: textFielDecoratiom.copyWith(
                                        fillColor: Colors.white,
                                        prefixIcon: const Icon(
                                            Icons.flight_takeoff_outlined)),
                                    onChanged: (value) {},
                                  ),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                const Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Mobile number',
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: AppColors.grayText,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 45,
                                  width: size.width - 50,
                                  child: TextField(
                                    readOnly: true,
                                    // controller: TextEditingController(
                                    //     text: widget.ContactPassengerDetails
                                    //         .mobilenumber),
                                    decoration: textFielDecoratiom.copyWith(
                                        fillColor: Colors.white,
                                        prefixIcon:
                                            const Icon(Icons.flight_land)),
                                    onChanged: (value) {},
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Passengers details',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Row(
                                          children: [
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Text(
                                              'Number of adults',
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: AppColors.grayText,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 45,
                                          width: size.width / 2 - 15,
                                          child: TextField(
                                            keyboardType: TextInputType.phone,
                                            decoration: textFielDecoratiom.copyWith(
                                                fillColor: Colors.white,
                                                prefixIcon: const Icon(Icons
                                                    .airline_seat_recline_normal)),
                                            onChanged: (value) {},
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Row(
                                          children: [
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              'Number of children',
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: AppColors.grayText,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 45,
                                          width: size.width / 2 - 15,
                                          child: TextField(
                                            readOnly: true,
                                            // controller: TextEditingController(
                                            //     text: flightDetails.Flight_price.toString()),
                                            decoration: textFielDecoratiom.copyWith(
                                                fillColor: Colors.white,
                                                prefixIcon: const Icon(Icons
                                                    .airplane_ticket_outlined)),
                                            onChanged: (value) {},
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Row(
                                          children: [
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Text(
                                              'Number of first class seats',
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: AppColors.grayText,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 45,
                                          width: size.width / 2 - 15,
                                          child: TextField(
                                            keyboardType: TextInputType.phone,
                                            decoration: textFielDecoratiom.copyWith(
                                                fillColor: Colors.white,
                                                prefixIcon: const Icon(Icons
                                                    .airline_seat_recline_extra_rounded)),
                                            onChanged: (value) {},
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Row(
                                          children: [
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              'Ticket Price',
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: AppColors.grayText,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 45,
                                          width: size.width / 2 - 15,
                                          child: TextField(
                                            keyboardType: TextInputType.phone,
                                            decoration: textFielDecoratiom.copyWith(
                                                fillColor: Colors.white,
                                                prefixIcon: const Icon(Icons
                                                    .airplane_ticket_outlined)),
                                            onChanged: (value) {},
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                InkWell(
                                  onTap: () {
                                    // Get.to(FlightBookingDetailsView(
                                    //   bookingId: widget
                                    //       .ContactPassengerDetails.bookingId,
                                    // ));
                                  },
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Row(
                                            children: [
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Text(
                                                'Show passengers ',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    color: AppColors.grayText,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ))),
          ]),
        ));
  }
}
