import 'package:flutter/cupertino.dart';
import '../ui/views/hotel_views/models/amenitiesModel.dart';

// ignore: must_be_immutable
class AmenitiesCard extends StatelessWidget {
  AmenitiesCard(
      {super.key, required this.amenitiesModel, required this.itemIndex});
  AmenitiesModel amenitiesModel;
  int itemIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(amenitiesModel.image),
          Text(amenitiesModel.title),
        ],
      ),
    );
  }
}
