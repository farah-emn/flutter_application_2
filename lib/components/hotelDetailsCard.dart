import 'package:flutter/material.dart';

import '../models/hotelDetailsModel.dart';

class HotelDetailsCard extends StatelessWidget {
   const HotelDetailsCard({
    super.key,
    required this.size,
    required this.hotelDetails,
    required this.itemIndex,
  });

  final Size size;
  final HotelDetailsModel hotelDetails;
  final int itemIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
      height: 180,
      child: Stack(
        children: [
          Container(
            height: 180,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    offset: const Offset(0, 2),
                    blurRadius: 4,),]),),
          Row(
            children: [
              Column(children: [ Container(
                    height: 180, width: size.width / 2 - 52, decoration:  BoxDecoration(
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),),
                      image: DecorationImage( image: AssetImage(hotelDetails.image),
                        fit: BoxFit.cover,),
                    ),),],),
              Container(margin: const EdgeInsets.only(
                  left: 10,top: 10,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Row(
                      children: [
                        SizedBox(
                          width: size.width / 2 + 10,
                          child: Text(
                            hotelDetails.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Beds:',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        SizedBox(
                          width: size.width / 2 - 45,
                          child: Text(
                            hotelDetails.beds,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'View:',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        SizedBox(
                          width: size.width / 2 - 43,
                          child: Text(
                            hotelDetails.view,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: size.width / 2 - 10,
                      height: 1,
                      color: const Color.fromARGB(255, 227, 227, 227),
                    ),
                    const SizedBox(height: 5,
                    ),
                    const Text(
                      'Starting from:',
                      style: TextStyle(fontWeight: FontWeight.w500),),
                     Row( crossAxisAlignment: CrossAxisAlignment.end,
                      children: [Row( crossAxisAlignment: CrossAxisAlignment.end,
                          children: [Text(hotelDetails.price,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.blue,
                              ),
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            const Text(
                              'SAR',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        const Row(
                          children: [
                            Text(
                              'See Details',
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                            Icon(Icons.arrow_drop_down, color: Colors.blue),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
