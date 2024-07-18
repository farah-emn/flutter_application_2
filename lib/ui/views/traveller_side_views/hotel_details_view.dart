import 'package:flutter/material.dart';
import 'package:traveling/cards/hotel_card2.dart';
import 'package:traveling/ui/shared/colors.dart';
import 'package:traveling/ui/shared/text_size.dart';

import '../../../classes/hotel_room_details_class.dart';
import '../../../cards/hotel_details_card.dart';

class HotelDetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: AppColors.lightPurple,
        body: SafeArea(
          child: Stack(
            children: [
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
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Hotel Details',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppColors.backgroundgrayColor),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15, left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 15),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                            top: 15,
                          ),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.favorite_rounded,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.share_rounded,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      'Shangri-La Bosphorus, Istanbul',
                      style: TextStyle(
                          fontSize: TextSize.header1,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: room.length,
                        itemBuilder: (context, index) => HotelCard2(
                          size: size,
                          itemIndex: index,
                          room: room[index],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
