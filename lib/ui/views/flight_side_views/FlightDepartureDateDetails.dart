// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:traveling/ui/shared/colors.dart';
import 'package:traveling/ui/shared/custom_widgets/custom_textfield2.dart';
import 'package:traveling/ui/shared/custom_widgets/custom_textgray.dart';
import 'package:traveling/ui/shared/utils.dart';

class DepartureDateDetails extends StatefulWidget {
  final Function(String) onDateSelected;
  final Rx<DateTime> Departure_date;
  final TextEditingController datecontroller;
  final Rx<DateTime> Return_date;
  final TextEditingController returnDateController;
  const DepartureDateDetails({
    super.key,
    required this.onDateSelected,
    required this.Departure_date,
    required this.datecontroller,
    required this.Return_date,
    required this.returnDateController,
  });

  @override
  State<DepartureDateDetails> createState() => _CheckInCheckOutDetailsState();
}

class _CheckInCheckOutDetailsState extends State<DepartureDateDetails> {
  DateTime minDate = DateTime.now();
  DateTime? newDepartureDate;
  DateTime? newReturnDate;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      child: Row(
        children: [
          SizedBox(
            height: 45,
            width: size.width / 2 - 15,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                backgroundColor: Colors.white,
              ),
              onPressed: () async {
                newDepartureDate = await showDatePicker(
                    context: context,
                    initialDate: widget.Departure_date.value,
                    firstDate: minDate,
                    lastDate: DateTime(2026));

                if (newDepartureDate != null) {
                  setState(() {
                    setState(
                        () => widget.Departure_date.value = newDepartureDate!);
                    if (widget.Return_date.value.isBefore(newDepartureDate!)) {
                      widget.Return_date.value = newDepartureDate!;
                      widget.returnDateController.text =
                          widget.datecontroller.text;
                      String formattedDate =
                          '${widget.Departure_date.value.month}/${widget.Departure_date.value.day}';
                      widget.onDateSelected(formattedDate);
                    }
                    if (widget.Return_date.value.isAfter(newDepartureDate!)) {
                      String formattedDate =
                          '${widget.Departure_date.value.month}/${widget.Departure_date.value.day}';
                      widget.onDateSelected(formattedDate);
                    }
                  });
                }
              },
              child: SizedBox(
                height: 45,
                width: size.width / 2 - 15,
                // decoration: BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: EdgeInsetsDirectional.only(),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.date_range_rounded,
                              color: AppColors.mainColorBlue),
                          SizedBox(
                            width: 8,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // CustomTextGray(mainText: 'Departure date'),
                              (newDepartureDate != null)
                                  ? Text(
                                      '${widget.Departure_date.value.day ?? ''}. ${widget.Departure_date.value?.month ?? ''}, ${widget.Departure_date.value?.year ?? ""}' ??
                                          '',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400),
                                    )
                                  : Text(
                                      '',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                    ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: size.width / 2 - 15,
                        height: 2, // Give the Divider a width
                        child: Divider(
                          height: 1,
                          color: AppColors.grayText,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 45,
            width: size.width / 2 - 15,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                backgroundColor: Colors.white,
              ),
              onPressed: () async {
                newReturnDate = await showDatePicker(
                    context: context,
                    initialDate: widget.Return_date.value,
                    firstDate: widget.Departure_date.value,
                    lastDate: DateTime(2026));
                if (newReturnDate != null) {
                  setState(() {
                    widget.Return_date.value = newReturnDate!;
                    widget.returnDateController.text =
                        '${widget.Return_date.value.day}. ${widget.Return_date.value.month}, ${widget.Return_date.value.year} ';
                  });
                }
              },
              child: SizedBox(
                height: 45,
                width: size.width / 2 - 15,
                // decoration: BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: EdgeInsetsDirectional.only(),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.date_range_rounded,
                              color: AppColors.mainColorBlue),
                          SizedBox(
                            width: 8,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // CustomTextGray(mainText: 'Departure date'),
                              (newReturnDate != null)
                                  ? Text(
                                      '${widget.Return_date.value.day ?? ''}. ${widget.Return_date.value?.month ?? ''}, ${widget.Return_date.value?.year ?? ""}' ??
                                          '',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400),
                                    )
                                  : Text(
                                      '',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                    ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: size.width / 2 - 30,
                        height: 2, // Give the Divider a width
                        child: Divider(
                          height: 1,
                          color: AppColors.grayText,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
