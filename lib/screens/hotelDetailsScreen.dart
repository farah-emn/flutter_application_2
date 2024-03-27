import 'package:flutter/material.dart';

import '../components/hotelDetailsBody.dart';
import '../constants.dart';

class HotelDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      backgroundColor: LightBlueColor,
      body: HotelDetailsBody(),
    );
  }
}




