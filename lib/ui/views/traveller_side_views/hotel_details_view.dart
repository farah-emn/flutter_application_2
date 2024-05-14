import 'package:flutter/material.dart';
import 'package:traveling/ui/shared/colors.dart';

import '../../../classes/hotel_room_details_class.dart';
import '../../../cards/hotel_details_card.dart';

class HotelDetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Scaffold(
      backgroundColor: AppColors.LightBlueColor,
      body: SafeArea(
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
    )
    );
  }
}
