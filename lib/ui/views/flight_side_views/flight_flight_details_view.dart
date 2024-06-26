// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unnecessary_null_comparison

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:traveling/cards/contact_details_passenger_card.dart';
import 'package:traveling/cards/passenger_adult_card.dart';
import 'package:traveling/classes/contact_details_passenger_class.dart';
import 'package:traveling/classes/flight_info_class.dart';
import 'package:traveling/classes/passenger_adult_details_class.dart';
import 'package:traveling/ui/shared/custom_widgets/tab_item.dart';

import '../../../cards/bookings_card.dart';
import '../../../classes/Bookings_class.dart';
import '../../shared/colors.dart';
import '../../shared/custom_widgets/custom_textfield2.dart';

class FlightFlightDetailsView extends StatefulWidget {
  FlightInfoClass flightDetails;

  FlightFlightDetailsView({super.key, required this.flightDetails});

  @override
  State<FlightFlightDetailsView> createState() =>
      _FlightFlightDetailsViewState();
}

class _FlightFlightDetailsViewState extends State<FlightFlightDetailsView> {
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
    print('ccccccccccccccc');
    print(PassengerAdultData.length);
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
                if (flightsDataa[keyy]['bookingId'] == key) {
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
                            setState(() {
                              PassengerAdultData[keyy] = flightsDataa;
                            });
                            // print(flightsDataa);

                            print('nnnnnnnnnnnnnnnnnnnnnnnn');

                            Map<dynamic, dynamic> flattenedMap = {};
                            PassengerAdultData.forEach((key, value) {
                              if (value is Map) {
                                value.forEach((key, value) {
                                  flattenedMap[key] = value;
                                });
                              } else {
                                flattenedMap[key] = value;
                              }
                            });
                            print(flattenedMap);
                            print('bbb');

                            ContactPassengerDetails =
                                flattenedMap.entries.map((entry) {
                              return ContactDetailsPassengerDetailsClass
                                  .fromMap({
                                'firstname':
                                    entry.value['firstname'], // corrected here
                                'Email': entry.value['Email'],

                                'mobilenumber':
                                    entry.value['mobilenumber'].toString(),
                                'bookingId':
                                    entry.value['bookingId'].toString(),
                                'lastname': entry.value['lastname'],
                                'flightId': flightsData[key]['flightId']
                              });
                            }).toList();
                          }
                        }
                      });
                    }
                  });
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
    if (ContactPassengerDetails != null) {
      print('llaaalllaaa');
    }
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColors.StatusBarColor,
          body: SafeArea(
            child: Stack(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 22),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Flight Details',
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
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    margin: const EdgeInsets.only(top: 100),
                    width: size.width - 30,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: AppColors.babyblueColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: const TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      dividerColor: AppColors.babyblueColor,
                      indicator: BoxDecoration(
                        color: AppColors.Blue,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      labelColor: Colors.white,
                      unselectedLabelColor: AppColors.Blue,
                      tabs: [
                        TabItem(title: 'Details', count: 1),
                        TabItem(title: 'Bookings', count: 2),
                      ],
                    ),
                  ),
                ),
                (PassengerAdultData != null)
                    ? Padding(
                        padding: const EdgeInsets.only(top: 170),
                        child: Expanded(
                          child: TabBarView(
                            children: [
                              flightDetails(context, widget.flightDetails),
                              bookingsContact(context, ContactPassengerDetails),
                            ],
                          ),
                        ),
                      )
                    : CircularProgressIndicator()
              ],
            ),
          ),
        ));
  }
}

Widget flightDetails(BuildContext context, FlightInfoClass flightDetails) {
  Size size = MediaQuery.of(context).size;
  return Padding(
    padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
    child: ListView(
      children: [
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Plane Details',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
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
                    'Plane id',
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
                      prefixIcon: const Icon(Icons.flight_takeoff_outlined)),
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
                    'Plane Features',
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
                      prefixIcon: const Icon(Icons.flight_takeoff_outlined)),
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
        const Text(
          'Flight details',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
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
                    'From',
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
                  readOnly: true, // This makes the TextField read-only
                  controller:
                      TextEditingController(text: flightDetails.airport_from),
                  keyboardType: TextInputType.phone,
                  decoration: textFielDecoratiom.copyWith(
                      fillColor: Colors.white,
                      prefixIcon: const Icon(Icons.flight_takeoff_outlined)),
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
                    'To',
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
                  controller:
                      TextEditingController(text: flightDetails.airport_to),
                  decoration: textFielDecoratiom.copyWith(
                      fillColor: Colors.white,
                      prefixIcon: const Icon(Icons.flight_land)),
                  onChanged: (value) {},
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Depature Time',
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
                          controller: TextEditingController(
                              text: flightDetails.DeparureTime),
                          decoration: textFielDecoratiom.copyWith(
                              fillColor: Colors.white,
                              prefixIcon: const Icon(Icons.access_time)),
                          onChanged: (value) {},
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Arrival Time',
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
                          controller: TextEditingController(
                              text: flightDetails.ArrivalTime),
                          decoration: textFielDecoratiom.copyWith(
                              fillColor: Colors.white,
                              prefixIcon:
                                  const Icon(Icons.access_time_outlined)),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Depature Date',
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
                          controller: TextEditingController(
                              text: flightDetails.DeparureDate),
                          decoration: textFielDecoratiom.copyWith(
                              fillColor: Colors.white,
                              prefixIcon: const Icon(Icons.date_range_rounded)),
                          onChanged: (value) {},
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Return Date',
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
                          controller: TextEditingController(
                              text: flightDetails.ArrivalDate),
                          decoration: textFielDecoratiom.copyWith(
                              fillColor: Colors.white,
                              prefixIcon: const Icon(Icons.date_range_rounded)),
                          onChanged: (value) {},
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        const Text(
          'Tickets and Seats',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Number of economy seats',
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
                              prefixIcon: const Icon(
                                  Icons.airline_seat_recline_normal)),
                          onChanged: (value) {},
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                          readOnly: true,
                          controller: TextEditingController(
                              text: flightDetails.Flight_price.toString()),
                          decoration: textFielDecoratiom.copyWith(
                              fillColor: Colors.white,
                              prefixIcon:
                                  const Icon(Icons.airplane_ticket_outlined)),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                              prefixIcon: const Icon(
                                  Icons.airline_seat_recline_extra_rounded)),
                          onChanged: (value) {},
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                              prefixIcon:
                                  const Icon(Icons.airplane_ticket_outlined)),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Child economy ticket price',
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
                              prefixIcon: const Icon(Icons.child_care)),
                          onChanged: (value) {},
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Child first class ticket price',
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
                              prefixIcon: const Icon(Icons.child_care)),
                          onChanged: (value) {},
                        ),
                      ),
                    ],
                  )
                ],
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
  );
}

Widget bookingsContact(BuildContext context,
    List<ContactDetailsPassengerDetailsClass> ContactPassengerDetails) {
  return (ContactPassengerDetails != null)
      ? Expanded(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: ContactPassengerDetails.length,
            itemBuilder: (context, index) {
              return ContactDetailsPassengerCard(
                itemIndex: index,
                ContactDetailsPassengerData: ContactPassengerDetails[index],
              );
            },
          ),
        )
      : CircularProgressIndicator();
}
