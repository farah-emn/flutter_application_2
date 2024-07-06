// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:traveling/ui/shared/colors.dart';
import 'package:traveling/ui/shared/custom_widgets/custom_textgray.dart';
import 'package:traveling/ui/shared/utils.dart';

class DepartureDateDetails extends StatefulWidget {
  final Function(String) onDateSelected;
  final Rx<DateTime> Departure_date;
  final TextEditingController datecontroller;
  const DepartureDateDetails({
    super.key,
    required this.onDateSelected,
    required this.Departure_date,
    required this.datecontroller,
  });

  @override
  State<DepartureDateDetails> createState() => _CheckInCheckOutDetailsState();
}

class _CheckInCheckOutDetailsState extends State<DepartureDateDetails> {
  DateTime minDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SizedBox(
      width: 180,
      height: 58,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            backgroundColor: Colors.white,
          ),
          onPressed: () async {
            DateTime? newDepartureDate = await showDatePicker(
                context: context,
                initialDate: widget.Departure_date.value,
                firstDate: minDate,
                lastDate: DateTime(2026));

            if (newDepartureDate != null) {
              setState(() {
                setState(() => widget.Departure_date.value = newDepartureDate);
              });
            }
          },
          child: Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Padding(
              padding: EdgeInsetsDirectional.only(),
              child: Row(
                children: [
                  Icon(Icons.calendar_month_outlined,
                      color: AppColors.IconBlueColor),
                  SizedBox(
                    width: 8,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextGray(mainText: 'Departure date'),
                      Text(
                        '${widget.Departure_date.value.day}. ${widget.Departure_date.value?.month}, ${widget.Departure_date.value?.year}',
                        style: TextStyle(
                            fontSize: screenWidth(25),
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  )
                ],
              ),
            ),
          )),
    ));
  }
}
