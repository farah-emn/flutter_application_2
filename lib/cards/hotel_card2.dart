import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:traveling/classes/hotel.dart';
import 'package:traveling/ui/shared/colors.dart';
import 'package:traveling/ui/shared/text_size.dart';
import 'package:traveling/ui/views/hotel_side_views/hotel_room_view.dart';

import '../ui/views/traveller_side_views/room_view.dart';
import '../classes/hotel_room_details_class.dart';

class HotelCard2 extends StatefulWidget {
  const HotelCard2({
    super.key,
    required this.size,
    required this.room,
    required this.itemIndex,
  });

  final Size size;
  final HotelRoomClass room;
  final int itemIndex;

  @override
  State<HotelCard2> createState() => _HotelCard2State();
}

class _HotelCard2State extends State<HotelCard2> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
          HotelRoomView(),
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
                      image: AssetImage(widget.room.image),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, top: 10, right: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        child: Text(
                          widget.room.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: TextSize.header1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                                widget.room.price,
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
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '100\$',
                            style: TextStyle(
                                color: AppColors.purple,
                                fontSize: TextSize.header1,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
