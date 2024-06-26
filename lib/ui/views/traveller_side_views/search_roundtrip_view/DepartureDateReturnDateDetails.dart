// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:traveling/ui/shared/colors.dart';
import 'package:traveling/ui/shared/custom_widgets/custom_textgray.dart';
import 'package:traveling/ui/shared/utils.dart';

class DepartureDateReturnDateDetails extends StatefulWidget {
  final Function(String) onDateSelected;
  final Rx<DateTime> Departure_date;
  final Rx<DateTime> Return_date;
  final TextEditingController datecontroller;
  final TextEditingController returnDateController;
  const DepartureDateReturnDateDetails({
    super.key,
    required this.onDateSelected,
    required this.Departure_date,
    required this.Return_date,
    required this.datecontroller,
    required this.returnDateController,
  });

  @override
  State<DepartureDateReturnDateDetails> createState() =>
      _CheckInCheckOutDetailsState();
}

class _CheckInCheckOutDetailsState
    extends State<DepartureDateReturnDateDetails> {
  DateTime minDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Container(
          child: SizedBox(
        width: 177,
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
                  setState(
                      () => widget.Departure_date.value = newDepartureDate);

                  if (widget.Return_date.value.isBefore(newDepartureDate)) {
                    widget.Return_date.value = newDepartureDate;
                    widget.returnDateController.text =
                        widget.datecontroller.text;
                    String formattedDate =
                        '${widget.Departure_date.value.month}/${widget.Departure_date.value.day}';
                    widget.onDateSelected(formattedDate);
                  }
                  if (widget.Return_date.value.isAfter(newDepartureDate)) {
                    String formattedDate =
                        '${widget.Departure_date.value.month}//${widget.Departure_date.value.day}';
                    widget.onDateSelected(formattedDate);
                  }
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
                          '${widget.Departure_date.value.day}. ${widget.Departure_date.value.month}, ${widget.Departure_date.value.year}',
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
      )),
      Container(
          child: SizedBox(
        width: 160,
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
              DateTime? newReturnDate = await showDatePicker(
                  context: context,
                  initialDate: widget.Return_date.value,
                  firstDate: widget.Departure_date.value,
                  lastDate: DateTime(2026));
              if (newReturnDate != null) {
                setState(() {
                  widget.Return_date.value = newReturnDate;
                  widget.returnDateController.text =
                      '${widget.Return_date.value.day}. ${widget.Return_date.value.month}, ${widget.Return_date.value.year} ';
                });
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
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
                        CustomTextGray(mainText: 'Return date'),
                        Text(
                          '${widget.Return_date.value.day}. ${widget.Return_date.value.month}, ${widget.Return_date.value.year}',
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
      ))
    ]);
  }
}
