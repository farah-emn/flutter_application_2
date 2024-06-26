// ignore_for_file: non_constant_identifier_names, unused_field, prefer_const_constructors, use_build_context_synchronously, unused_local_variable, no_leading_underscores_for_local_identifiers, unnecessary_null_comparison, deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:traveling/controllers/flight_add_controller.dart';
import 'package:traveling/controllers/flight_currency_controller.dart';
import 'package:traveling/controllers/search_oneway_controller.dart';
import 'package:traveling/ui/views/flight_side_views/FlightDepartureDateDetails.dart';
import '../../shared/colors.dart';
import '../../shared/custom_widgets/custom_button.dart';
import '../../shared/custom_widgets/custom_textfield2.dart';

class FlightAddView extends StatefulWidget {
  const FlightAddView({super.key});
  @override
  State<FlightAddView> createState() => _FlightAddViewState();
}

class _FlightAddViewState extends State<FlightAddView> {
  final FlightAddController controller = Get.put(FlightAddController());
  final FlightCurrencyController FlightCurrencycontroller =
      Get.put(FlightCurrencyController());
  User? AirelineCompany;
  final _auth = FirebaseAuth.instance;
  var AirelineCompanyId = '';
  var AirelineCompanyName = '';
  var uid;
  var currentUser;
  void _handleDateSelection(String dateText) {
    DeparturedateController.text = dateText;
  }

  final TextEditingController DeparturedateController = TextEditingController();
  final TextEditingController ArivaldateController = TextEditingController();
  final _Planeid = TextEditingController();
  final _Model = TextEditingController();
  final _Manufacturer = TextEditingController();
  final _AirportFrom = TextEditingController();
  final _AirportTo = TextEditingController();
  final _AirportFromId = TextEditingController();
  final _AirportToId = TextEditingController();
  final _CountryDeparture = TextEditingController();
  final _CountryArrival = TextEditingController();
  final _CityDeparture = TextEditingController();
  final _CityArrival = TextEditingController();
  final _NumberOfEconomySeats = TextEditingController();
  final _NumberOfFirstClassSeats = TextEditingController();
  final _TicketPriceEconomySeat = TextEditingController();
  final _TicketFirstClassPriceSeat = TextEditingController();
  final _TicketChildPriceEconomy = TextEditingController();
  final _TicketChildFirstClassPrice = TextEditingController();
  final FlightCurrencyController FlightCurrency_Controller =
      Get.find<FlightCurrencyController>();

  @override
  void initState() {
    controller.clearData();
    super.initState();
    currentUser = _auth.currentUser;
    uid = currentUser?.uid;
    setState(() {
      AirelineCompany = _auth.currentUser;
      AirelineCompanyId = AirelineCompany?.uid.toString() ?? '';
    });
  }

  bool? isChecked = false;
  TimeOfDay? _departureTime;
  TimeOfDay? _arrivalTime;

  Future<void> _selectDepartureTime(BuildContext context) async {
    final TimeOfDay now = TimeOfDay.now();
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _departureTime ?? now,
    );

    if (picked != null && picked != _departureTime) {
      if (DateTime.now().compareTo(controller.departureDate.value) == 1 &&
          (picked.hour < now.hour ||
              (picked.hour == now.hour && picked.minute < now.minute))) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: Text('Departure time cannot be in the past.'),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      } else {
        setState(() {
          _departureTime = picked;
        });
      }
    }
  }

  Future<void> _selectArrivalTime(BuildContext context) async {
    final TimeOfDay now = TimeOfDay.now();
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _arrivalTime ?? now,
    );

    if (picked != null && picked != _arrivalTime) {
      if (DateTime.now().compareTo(controller.ReturnDate.value) == 1 &&
          (picked.hour < now.hour ||
              (picked.hour == now.hour && picked.minute < now.minute))) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Arrival time cannot be in the past.'),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      } else if (_departureTime != null &&
          (picked.hour < _departureTime!.hour ||
              (picked.hour == _departureTime!.hour &&
                  picked.minute < _departureTime!.minute))) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Arrival time cannot be before departure time.'),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      } else {
        setState(() {
          _arrivalTime = picked;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    String AirportFrom = '';
    String AirportTo = '';
    int NumberOfEconomySeats;
    int NumberOfFirstClassSeats;
    double TicketPriceEconomySeat;
    double TicketFirstClassPriceSeat;
    double TicketChildPriceEconomy;
    double TicketChildFirstClassPrice;
    Size size = MediaQuery.of(context).size;

    void _confirm() async {
      if (_AirportFrom.text != null &&
          _AirportFromId.text != null &&
          _AirportTo != null &&
          _AirportToId != null &&
          _CityArrival != null &&
          _CityDeparture != null &&
          _CountryArrival != null &&
          _CountryDeparture != null &&
          _Manufacturer != null &&
          _Model != null &&
          _NumberOfEconomySeats != null &&
          _NumberOfFirstClassSeats != null &&
          _Planeid != null &&
          _TicketChildFirstClassPrice != null &&
          _TicketChildPriceEconomy != null &&
          _TicketFirstClassPriceSeat != null &&
          _TicketPriceEconomySeat != null &&
          _arrivalTime != null &&
          _departureTime != null &&
          controller.departureDate != null &&
          controller.ReturnDate != null) {
        // Convert TimeOfDay to DateTime
        DateTime departureDateTime = DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
            _departureTime!.hour,
            _departureTime!.minute);
        DateTime arrivalDateTime = DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
            _arrivalTime!.hour,
            _arrivalTime!.minute);
        Duration difference = arrivalDateTime.difference(departureDateTime);
        String differenceInHours =
            '${difference.inHours.toString().padLeft(2, '0')}h ${difference.inMinutes.remainder(60).toString().padLeft(2, '0')}m';

        // FirebaseDatabase.instance
        //     .reference()
        //     .child('Airports')
        //     .child(_AirportFromId.text)
        //     .push()
        //     .set({
        //   "AirportName": _AirportFrom.text,
        //   "Location": '${_CityDeparture.text}, ${_CountryDeparture.text}'
        // });
        // FirebaseDatabase.instance
        //     .reference()
        //     .child('Airports')
        //     .child(_AirportToId.text)
        //     .push()
        //     .set({
        //   "AirportNmae": _AirportTo.text,
        //   "Location": '${_CityArrival.text}, ${_CountryArrival.text}',
        // });
        // FirebaseDatabase.instance
        //     .reference()
        //     .child('Planes')
        //     .child(_Planeid.text)
        //     .push()
        //     .set({
        //   "Model": _Model.text,
        //   "Manufacturer": _Manufacturer.text,
        // });
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Flight added'),
              content: Text(''),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    try {
                      double numberValue =
                          double.parse(_TicketChildFirstClassPrice.text);
                      // Save numberValue to Firebase
                    } catch (e) {
                      print('Could not parse text field value to a number: $e');
                    }

                    FirebaseDatabase.instance
                        .reference()
                        .child('Flight')
                        .push()
                        .set({
                      "DepartureAirportID": _AirportFromId.text,
                      "ArrivalAirportID": _AirportToId.text,
                      "AirlinId": AirelineCompanyId,
                      "PlaneId": _Planeid.text,
                      // "FlightDuration": differenceInHours,
                      // "DepartureDate": controller.departureDate.value,
                      // "ArrivalDate": controller.ReturnDate.value,
                      "DepartureTime": _departureTime?.format(context),
                      "ArrivalTime": _arrivalTime?.format(context),
                      "NumberOfEconomySeats": _NumberOfEconomySeats.text,
                      // "NumberOfFirstClassSeats":
                      //     int.parse(_NumberOfFirstClassSeats.text),
                      // "TicketChildFirstClassPrice":
                      //     double.parse(_TicketChildFirstClassPrice.text),
                      // "TicketChildEconomyPrice":
                      //     double.parse(_TicketChildPriceEconomy.text),
                      // // "TicketAdultEconomyPrice": double.parse(_TicketPriceEconomySeat.text),
                      // "TicketAdultFirstClassPrice":
                      //     double.parse(_TicketFirstClassPriceSeat.text),
                    });
                    Navigator.of(context).pop();
                    _AirportFrom.clear();
                    _AirportFromId.clear();
                    _AirportTo.clear();
                    _AirportToId.clear();
                    _CityArrival.clear();
                    _CityDeparture.clear();
                    _CountryArrival.clear();
                    _CountryDeparture.clear();
                    _Manufacturer.clear();
                    _NumberOfEconomySeats.clear();
                    _NumberOfFirstClassSeats.clear();
                    _Planeid.clear();
                    _TicketChildFirstClassPrice.clear();
                    _TicketChildPriceEconomy.clear();
                    _TicketFirstClassPriceSeat.clear();
                    _TicketPriceEconomySeat.clear();
                    _arrivalTime;
                    _departureTime;
                    controller.clearData();
                  },
                ),
              ],
            );
          },
        );
        // } else {
        //   FirebaseDatabase.instance
        //       .reference()
        //       .child('Airports')
        //       .child(_AirportFromId.text)
        //       .push()
        //       .set({
        //     "Airport": "ll",
        //     "Country":,
        //     "City": ,
        //   });
      } else {
        print(controller.departureDate.value);
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.StatusBarColor,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(),
                  Spacer(),
                  Text(
                    'Add Flight',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppColors.backgroundgrayColor),
                  ),
                  Spacer(),
                  InkWell(
                      onTap: () => _confirm(),
                      child: Icon(
                        Icons.save_as,
                        color: AppColors.backgroundgrayColor,
                      )),
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
                  padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Plane Details',
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
                                controller: _Planeid,
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
                                  'Plane Model',
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
                                controller: _Model,
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
                                  'Plane Manufacturer',
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
                                controller: _Manufacturer,
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
                      const Text(
                        'Flight details',
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
                                  'Departure airport id',
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
                                controller: _AirportFromId,
                                keyboardType: TextInputType.phone,
                                decoration: textFielDecoratiom.copyWith(
                                    fillColor: Colors.white,
                                    prefixIcon: const Icon(
                                        Icons.flight_takeoff_outlined)),
                                onChanged: (value) {
                                  AirportFrom = value;
                                },
                              ),
                            ),
                            const SizedBox(height: 15),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Airport Departure',
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: AppColors.grayText,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 45,
                              width: size.width - 50,
                              child: TextField(
                                controller: _AirportFrom,
                                keyboardType: TextInputType.phone,
                                decoration: textFielDecoratiom.copyWith(
                                    fillColor: Colors.white,
                                    prefixIcon: const Icon(
                                        Icons.flight_takeoff_outlined)),
                                onChanged: (value) {
                                  AirportFrom = value;
                                },
                              ),
                            ),
                            SizedBox(
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
                                          'Depature City',
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
                                        controller: _CityDeparture,
                                        keyboardType: TextInputType.text,
                                        decoration: textFielDecoratiom.copyWith(
                                            fillColor: Colors.white,
                                            prefixIcon:
                                                const Icon(Icons.public)),
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
                                          'Departure country',
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
                                        controller: _CountryDeparture,
                                        keyboardType: TextInputType.text,
                                        decoration: textFielDecoratiom.copyWith(
                                            fillColor: Colors.white,
                                            prefixIcon:
                                                const Icon(Icons.public)),
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
                            const Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Arrival Airport id',
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
                                controller: _AirportToId,
                                keyboardType: TextInputType.text,
                                decoration: textFielDecoratiom.copyWith(
                                    fillColor: Colors.white,
                                    prefixIcon: const Icon(Icons.flight_land)),
                                onChanged: (value) {
                                  AirportTo = value;
                                },
                              ),
                            ),
                            SizedBox(
                              height: 35,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Arrival Airport',
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
                                controller: _AirportTo,
                                keyboardType: TextInputType.phone,
                                decoration: textFielDecoratiom.copyWith(
                                    fillColor: Colors.white,
                                    prefixIcon: const Icon(Icons.flight_land)),
                                onChanged: (value) {
                                  AirportFrom = value;
                                },
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
                                          'Arrival City',
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
                                        controller: _CityArrival,
                                        keyboardType: TextInputType.text,
                                        decoration: textFielDecoratiom.copyWith(
                                            fillColor: Colors.white,
                                            prefixIcon:
                                                const Icon(Icons.access_time)),
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
                                          'Arrival country',
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
                                        controller: _CountryArrival,
                                        keyboardType: TextInputType.text,
                                        decoration: textFielDecoratiom.copyWith(
                                            fillColor: Colors.white,
                                            prefixIcon: const Icon(
                                                Icons.access_time_outlined)),
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
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                          onTap: () {
                                            _selectDepartureTime(context);
                                          },
                                          controller: TextEditingController(
                                              text: _departureTime
                                                  ?.format(context)),
                                          keyboardType: TextInputType.datetime,
                                          decoration:
                                              textFielDecoratiom.copyWith(
                                                  fillColor: Colors.white,
                                                  prefixIcon: const Icon(
                                                      Icons.access_time)),
                                          onChanged: (value) {},
                                        ),
                                      ),
                                    ],
                                  ),
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
                                        onTap: () {
                                          _selectArrivalTime(context);
                                        },
                                        controller: TextEditingController(
                                            text:
                                                _arrivalTime?.format(context)),
                                        keyboardType: TextInputType.datetime,
                                        decoration: textFielDecoratiom.copyWith(
                                            fillColor: Colors.white,
                                            prefixIcon: const Icon(
                                                Icons.access_time_outlined)),
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
                                    SizedBox(height: 10),
                                    // SizedBox(
                                    //   // height: 45,
                                    //   // width: size.width / 2 - 15,
                                    //   child:
                                    Column(
                                      children: [
                                        // DepartureDateDetails(
                                        //   onDateSelected: _handleDateSelection,
                                        //   Departure_date:
                                        //       controller.departureDate,
                                        //   datecontroller:
                                        //       DeparturedateController,
                                        // ),

                                        DepartureDateDetails(
                                            onDateSelected:
                                                _handleDateSelection,
                                            Departure_date:
                                                controller.departureDate,
                                            Return_date: controller.ReturnDate,
                                            datecontroller:
                                                DeparturedateController,
                                            returnDateController:
                                                ArivaldateController),
                                      ],
                                    ),
                                    //  ),
                                  ],
                                ),
                                // Column(
                                //   crossAxisAlignment: CrossAxisAlignment.start,
                                //   children: [
                                //     const Row(
                                //       children: [
                                //         SizedBox(
                                //           width: 10,
                                //         ),
                                //         Text(
                                //           'Arrival Date',
                                //           style: TextStyle(
                                //               fontSize: 13,
                                //               color: AppColors.grayText,
                                //               fontWeight: FontWeight.w500),
                                //         ),
                                //       ],
                                //     ),
                                //     Column(
                                //       children: [
                                //         // ArrivalDateDetails(
                                //         //   onDateSelected: _handleDateSelection,
                                //         //   Arrival_date: controller.ArrivalDate,
                                //         //   arrivalDateController:
                                //         //       ArivaldateController,
                                //         // ),
                                //       ],
                                //     ),
                                //   ],
                                // )
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  value: isChecked,
                                  onChanged: (bool? newValue) {
                                    setState(
                                      () {
                                        isChecked = newValue;
                                      },
                                    );
                                  },
                                ),
                                const Text('Direct Flight'),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        'Tickets and Seats',
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
                                        controller: _NumberOfEconomySeats,
                                        keyboardType: TextInputType.number,
                                        decoration: textFielDecoratiom.copyWith(
                                            fillColor: Colors.white,
                                            prefixIcon: const Icon(Icons
                                                .airline_seat_recline_normal)),
                                        onChanged: (value) {
                                          NumberOfEconomySeats =
                                              int.parse(value);
                                        },
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
                                        controller: TextEditingController(
                                            text: _TicketPriceEconomySeat.text),
                                        keyboardType: TextInputType.number,
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
                                        controller: _NumberOfFirstClassSeats,
                                        keyboardType: TextInputType.number,
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
                                        controller: _TicketFirstClassPriceSeat,
                                        keyboardType: TextInputType.number,
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
                                        controller: _TicketChildPriceEconomy,
                                        keyboardType: TextInputType.number,
                                        decoration: textFielDecoratiom.copyWith(
                                            fillColor: Colors.white,
                                            prefixIcon:
                                                const Icon(Icons.child_care)),
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
                                        controller: _TicketChildFirstClassPrice,
                                        keyboardType: TextInputType.number,
                                        decoration: textFielDecoratiom.copyWith(
                                            fillColor: Colors.white,
                                            prefixIcon:
                                                const Icon(Icons.child_care)),
                                        onChanged: (value) {},
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            // const SizedBox(
                            //   height: 15,
                            // ),
                          ],
                        ),
                      ),
                      // const SizedBox(
                      //   height: 15,
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
