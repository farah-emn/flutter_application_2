// ignore_for_file: deprecated_member_use, non_constant_identifier_names, prefer_typing_uninitialized_variables, must_be_immutable, unnecessary_null_comparison

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:traveling/cards/passenger_adult_card.dart';
import 'package:traveling/classes/flight_info_class.dart';
import 'package:traveling/classes/passenger_adult_details_class.dart';
import 'package:traveling/ui/shared/colors.dart';
import 'package:traveling/ui/shared/custom_widgets/tab_item.dart';

class FlightBookingDetailsView extends StatefulWidget {
  String? bookingId;
  FlightBookingDetailsView({super.key, required this.bookingId});

  @override
  State<FlightBookingDetailsView> createState() =>
      _FlightBookingDetailsViewState();
}

class _FlightBookingDetailsViewState extends State<FlightBookingDetailsView> {
  bool? isChecked = false;
  String? sorteBy;
  User? AirelineCompany;
  final _auth = FirebaseAuth.instance;
  var AirelineCompanyId = '';
  var AirelineCompanyName = '';
  var uid;
  var currentUser;
  List<PassengerAdultDetailsClass> passengerAdultData = [];
  List<FlightInfoClass> flightsList = [];
  List<FlightInfoClass> filteredFlights = [];

  @override
  void initState() {
    super.initState();

    currentUser = _auth.currentUser;
    uid = currentUser?.uid;
    setState(() {
      getData();
      AirelineCompany = _auth.currentUser;
      AirelineCompanyId = AirelineCompany?.uid.toString() ?? '';
    });
  }

  void getData() async {
    final event =
        await FirebaseDatabase.instance.ref('Airline Company').child(uid).get();
    final AirelineCompanyData = Map<dynamic, dynamic>.from(event.value as Map);
    AirelineCompanyName = AirelineCompanyData['AirlineCompanyName'];
    fetchFlights();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<List<PassengerAdultDetailsClass>> fetchFlights() async {
    passengerAdultData.clear();
    await FirebaseDatabase.instance
        .reference()
        .child('passenger')
        .once()
        .then((DatabaseEvent event) {
      if (event.snapshot.exists) {
        var passengerData =
            Map<dynamic, dynamic>.from(event.snapshot.value as Map);
        passengerData.forEach((key, value) {
          if (widget.bookingId == passengerData[key]['bookingid']) {
            var passengerDataa =
                Map<dynamic, dynamic>.from(event.snapshot.value as Map);
            var filteredPassengerData = {};
            passengerDataa.forEach((key, value) {
              if (value['bookingid'] == widget.bookingId) {
                filteredPassengerData[key] = value;
              }
              if (filteredPassengerData != null) {
                setState(() {
                  passengerAdultData =
                      filteredPassengerData.entries.map((entry) {
                    return PassengerAdultDetailsClass.fromMap({
                      'Firstname': entry.value['Firstname'],
                      'Lastname': entry.value['Lastname'],
                      'birthDate': entry.value['birthDate'],
                      'Nationality': entry.value['Nationality'],
                      'bookingid': entry.value['bookingid'],
                      'issuingCountryPassport':
                          entry.value['issuingCountryPassport'],
                      'PassportNumber': entry.value['PassportNumber'],
                      'Gender': entry.value['Gender'],
                      'ExpirationDatePassport':
                          entry.value['ExpirationDatePassport']
                    });
                  }).toList();
                });
              }
            });
          } // FirebaseDatabase.instance
          //     .reference()
          //     .child('flights')
          //     .once()
          //     .then((DatabaseEvent eventt) {
          //   if (eventt.snapshot.exists) {
          //     var flightsData =
          //         Map<dynamic, dynamic>.from(eventt.snapshot.value as Map);
          //     flightsData.forEach((key, value) {
          //       print(flightsData[key]['name']);
          //       print('777');
          //       print(key);
          //       print(flightsDataa[keyy]['FlightId']);
          //       if (flightsDataa[keyy]['FlightId'] == key) {
          //         if (flightsData[key]['name'] == AirelineCompanyName) {
          //           setState(() {
          //             PassengerAdultData[keyy] = PassengerAdultDetailsClass.fromMap(
          //                 FlightData); // Convert the Map to a PassengerAdultDetailsClass
          //           });
          //           print(FlightData);
          //         }
          //       }
          //     });
          //   }
          // });
        });
      }
    });
    return passengerAdultData;
  }

  @override
  Widget build(BuildContext context) {
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
                        'Booking Details',
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
                        TabItem(title: 'Adult', count: 1),
                        TabItem(title: 'Children', count: 2),
                      ],
                    ),
                  ),
                ),
                (passengerAdultData != null)
                    ? Padding(
                        padding: const EdgeInsets.only(top: 170),
                        child: Expanded(
                          child: TabBarView(
                            children: [
                              // AdultPassenger(context),
                              AdultPassenger(context, passengerAdultData),
                              AdultPassenger(context, passengerAdultData),

                              // bookings(context),
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

Widget AdultPassenger(
    BuildContext context, List<PassengerAdultDetailsClass> PassengerAdultData) {
  return (PassengerAdultData != null)
      ? Expanded(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: PassengerAdultData.length,
            itemBuilder: (context, index) {
              return PassengerAdultCard(
                itemIndex: index,
                PassengerAdultData: PassengerAdultData[index],
              );
            },
          ),
        )
      : CircularProgressIndicator();
}
