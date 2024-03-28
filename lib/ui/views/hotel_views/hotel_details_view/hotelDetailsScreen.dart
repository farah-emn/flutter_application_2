import 'package:flutter/material.dart';
import 'package:traveling/ui/shared/colors.dart';

import '../../../../components/hotelDetailsBody.dart';

class HotelDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.LightBlueColor,
      body: HotelDetailsBody(),
    );
  }
}
