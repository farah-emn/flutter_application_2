// ignore_for_file: must_be_immutable, prefer_const_constructors
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:traveling/classes/flight_info_class.dart';
import 'package:traveling/classes/passenger_adult_details_class.dart';
import 'package:traveling/ui/views/flight_side_views/flight_booking_view.dart';
import '../classes/Bookings_class.dart';
import '../ui/shared/colors.dart';

class BookingsCard extends StatefulWidget {
  BookingsCard(
      {super.key, required this.bookingsModel, required this.itemIndex});
  BookingsClass bookingsModel;
  int itemIndex;

  @override
  State<BookingsCard> createState() => _BookingsCardState();
}

class _BookingsCardState extends State<BookingsCard> {
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
      setState(() {
        PassengerAdultData = fetchedFlights;
        flightsList = fetchedFlights.entries.map((entry) {
          var stringKeyedMap = Map<dynamic, dynamic>.from(entry.value);
          return FlightInfoClass.fromMap(stringKeyedMap);
        }).toList();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<Map> fetchFlights() async {
    PassengerAdultData.clear(); // Clear the map

    await FirebaseDatabase.instance
        .reference()
        .child('contact_details_passenger')
        .once()
        .then((DatabaseEvent event) {
      if (event.snapshot.exists) {
        print('lll');
        var flightsDataa =
            Map<dynamic, dynamic>.from(event.snapshot.value as Map);

        flightsDataa.forEach((keyy, value) {
          var FlightData = Map<dynamic, dynamic>.from(value);
          FirebaseDatabase.instance
              .reference()
              .child('booking')
              .once()
              .then((DatabaseEvent eventt) {
            if (eventt.snapshot.exists) {
              var flightsData =
                  Map<dynamic, dynamic>.from(eventt.snapshot.value as Map);
              flightsData.forEach((key, value) {
                print(key);
                if (flightsDataa[keyy]['bookingId'] == key) {
                  print(flightsDataa[keyy]['bookingId']);
                  FirebaseDatabase.instance
                      .reference()
                      .child('flights')
                      .once()
                      .then((DatabaseEvent eventt) {
                    if (eventt.snapshot.exists) {
                      var flightsDataFlight = Map<dynamic, dynamic>.from(
                          eventt.snapshot.value as Map);
                      flightsDataFlight.forEach((Flightkey, value) {
                        print('ll9l');
                        print(Flightkey);
                        print(flightsData[key]['flightId']);

                        if (Flightkey == flightsData[key]['flightId']) {
                          print('bggg');
                          if (flightsDataFlight[Flightkey]['name'] ==
                              AirelineCompanyName) {
                            print(AirelineCompanyName);
                            PassengerAdultData[keyy] =
                                PassengerAdultDetailsClass.fromMap(
                                    flightsDataa);
                          }

                          // if (flightsData[key]['bookingId'] ==
                          //     AirelineCompanyName) {
                          //   setState(() {
                          //     PassengerAdultData[keyy] =
                          //         PassengerAdultDetailsClass.fromMap(
                          //             FlightData); // Convert the Map to a PassengerAdultDetailsClass
                          //   });
                          //   print(FlightData);
                          // }
                        }
                      });
                    }
                  });

                  // if (flightsData[key]['bookingId'] == AirelineCompanyName) {
                  //   setState(() {
                  //     PassengerAdultData[keyy] = PassengerAdultDetailsClass.fromMap(
                  //         FlightData); // Convert the Map to a PassengerAdultDetailsClass
                  //   });
                  //   print(FlightData);
                  // }
                  //    }
                }
              });
            }
          });
        });
      }
    });

    return PassengerAdultData;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Get.to(FlightBookingDetailsView(
          bookingId: ' ',
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
                                widget.bookingsModel.userName,
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
                                    Icons.man,
                                    color: AppColors.darkBlue,
                                  ),
                                  const Text(
                                    'Adults:',
                                    style: TextStyle(
                                        color: AppColors.TextBlackColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    widget.bookingsModel.audultNumber,
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
                                    widget.bookingsModel.childrenNumber,
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