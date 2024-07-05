import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:traveling/classes/hotel.dart';
import 'package:traveling/ui/shared/colors.dart';
import 'package:traveling/ui/shared/text_size.dart';

import '../ui/views/traveller_side_views/room_view.dart';
import '../classes/hotel_room_details_class.dart';

class HotelCard extends StatefulWidget {
  const HotelCard({
    super.key,
    required this.size,
    required this.hotelDetails,
    required this.itemIndex,
  });

  final Size size;
  final HotelClass hotelDetails;
  final int itemIndex;

  @override
  State<HotelCard> createState() => _HotelCardState();
}

class _HotelCardState extends State<HotelCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
          RoomView(),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: List.filled(
            10,
            BoxShadow(
                color: AppColors.gray,
                blurRadius: BorderSide.strokeAlignOutside,
                blurStyle: BlurStyle.outer),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        width: widget.size.width,
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  height: 200,
                  width: widget.size.width,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                    image: DecorationImage(
                      image: AssetImage(widget.hotelDetails.image),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, top: 10, right: 10),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            child: Text(
                              widget.hotelDetails.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: TextSize.header1,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: AppColors.purple,
                            size: 20,
                          ),
                          Text(
                            widget.hotelDetails.location,
                            style: const TextStyle(
                                color: AppColors.grayText,
                                fontSize: TextSize.header2),
                          ),
                        ],
                      ),
                      const Row(
                        children: [
                          Icon(
                            Icons.star_rounded,
                            color: AppColors.gold,
                            size: 20,
                          ),
                          Icon(
                            Icons.star_rounded,
                            color: AppColors.gold,
                            size: 20,
                          ),
                          Icon(
                            Icons.star_rounded,
                            color: AppColors.gold,
                            size: 20,
                          ),
                          Icon(
                            Icons.star_half_rounded,
                            color: AppColors.gold,
                            size: 20,
                          ),
                          Icon(
                            Icons.star_border_rounded,
                            color: AppColors.gold,
                            size: 20,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Column(
                    children: [
                      Text(
                        'Start from:',
                        style: TextStyle(
                          color: AppColors.grayText,
                        ),
                      ),
                      Text(
                        '500\$',
                        style: TextStyle(
                            color: AppColors.purple,
                            fontSize: TextSize.header1,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
