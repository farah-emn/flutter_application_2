import 'package:flutter/material.dart';
import 'package:traveling/ui/shared/colors.dart';

import '../ui/views/hotel_views/models/hotelDetailsModel.dart';
import 'hotelDetailsCard.dart';

class HotelDetailsBody extends StatelessWidget {
  const HotelDetailsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Stack(
        children: [
          Positioned(
            child: Image.asset('assets/image/png/hotel.jpg'),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 230,
            ),
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/image/png/background1.png'),
                    fit: BoxFit.fill),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 15, top: 15),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      right: 15,
                      top: 15,
                    ),
                    child: const Row(
                      children: [
                        ImageIcon(
                          AssetImage('assets/image/png/favorite.png'),
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        ImageIcon(
                          AssetImage('assets/image/png/share_icon.png'),
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 160,
              ),
              Container(
                padding: const EdgeInsets.only(
                  left: 15,
                ),
                child: const Text(
                  'Shangri-La Bosphorus, Istanbul',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const CheckInCheckOutDetails(),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: details.length,
                  itemBuilder: (context, index) => HotelDetailsCard(
                    size: size,
                    itemIndex: index,
                    hotelDetails: details[index],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CheckInCheckOutDetails extends StatefulWidget {
  const CheckInCheckOutDetails({
    super.key,
  });

  @override
  State<CheckInCheckOutDetails> createState() => _CheckInCheckOutDetailsState();
}

class _CheckInCheckOutDetailsState extends State<CheckInCheckOutDetails> {
  DateTime? date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 15),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.backgroundgrayColor,
                foregroundColor: Colors.black),
            onPressed: () async {
              DateTime? newDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2024),
                  lastDate: DateTime(2025));
              setState(() => date = newDate);
            },
            child: Row(
              children: [
                const Text(
                  "Check in",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '${date?.month}/${date?.day}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: AppColors.mainColorBlue),
                ),
              ],
            ),
          ),
        ),
        const ImageIcon(
          AssetImage('assets/image/png/arrow_icon.png'),
          color: Colors.black,
        ),
        Container(
          margin: const EdgeInsets.only(right: 15),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.backgroundgrayColor,
                foregroundColor: Colors.black),
            onPressed: () async {
              DateTime? newDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2024),
                  lastDate: DateTime(2025));
              setState(() => date = newDate);
            },
            child: Row(
              children: [
                const Text(
                  "Check out",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '${date?.month}/${date?.day}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: AppColors.mainColorBlue),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
