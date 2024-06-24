// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, annotate_overrides, unused_field, prefer_final_fields, non_constant_identifier_names, unused_local_variable, prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, avoid_types_as_parameter_names, unnecessary_null_comparison, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:traveling/controllers/Step3payment_controller.dart';
import 'package:traveling/controllers/search_oneway_controller.dart';
import 'package:traveling/controllers/traveller_details_view1_controller.dart';
import 'package:traveling/controllers/currency_controller.dart';
import 'package:traveling/controllers/flight_info_controller.dart';
import 'package:traveling/controllers/search_roundtrip_controller.dart';
import 'package:traveling/ui/shared/colors.dart';
import 'package:traveling/ui/shared/custom_widgets/custom_textfield2.dart';
import 'package:traveling/ui/shared/utils.dart';

class TravellerDetailsView3 extends StatefulWidget {
  @override
  _TravellerDetailsView3State createState() => _TravellerDetailsView3State();
}

class _TravellerDetailsView3State extends State<TravellerDetailsView3> {
  final Step3Controller Step3controller = Get.put(Step3Controller());
  final TravellerDetailsView1Controller detailsView1Controller =
      Get.find<TravellerDetailsView1Controller>();
  final SearchViewOneWayController SearchViewOneWay_Controller =
      Get.find<SearchViewOneWayController>();
  final SearchViewRoundTripController SearchViewRoundTrip_Controller =
      Get.find<SearchViewRoundTripController>();
  final FlightInfoController controller_flight =
      Get.find<FlightInfoController>();
  final CurrencyController currencyController = Get.put(CurrencyController());

  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double totalAmountExtraBaggage = 0;
    detailsView1Controller.BaggageAdult.map((Baggage_Option) {
      if (Baggage_Option == BaggageOption.option15kg) {
        totalAmountExtraBaggage = totalAmountExtraBaggage + 100.50;
      }
      if (Baggage_Option == BaggageOption.option20kg) {
        totalAmountExtraBaggage = totalAmountExtraBaggage + 200.87;
      }
      if (Baggage_Option == BaggageOption.option25kg) {
        totalAmountExtraBaggage = totalAmountExtraBaggage + 300.50;
      }
      detailsView1Controller.BaggageChild.map((Baggage_Option) {
        if (Baggage_Option == BaggageOption.option15kg) {
          totalAmountExtraBaggage = totalAmountExtraBaggage + 100.50;
        }
        if (Baggage_Option == BaggageOption.option20kg) {
          totalAmountExtraBaggage = totalAmountExtraBaggage + 200.87;
        }
        if (Baggage_Option == BaggageOption.option25kg) {
          totalAmountExtraBaggage = totalAmountExtraBaggage + 300.50;
        }
      }).toList();
    }).toList();

    //
    double totalPriceTicketFlight = 0;

    if (SearchViewOneWay_Controller.totalpriceflight != 0.0) {
      totalPriceTicketFlight = (SearchViewOneWay_Controller.totalpriceflight *
              detailsView1Controller.AdultList.length) +
          ((SearchViewOneWay_Controller.totalpriceflight *
              detailsView1Controller.ChildList.length));
    }

    if (SearchViewRoundTrip_Controller.totalflightprice != 0.0) {
      totalPriceTicketFlight =
          (SearchViewRoundTrip_Controller.totalflightprice *
                  detailsView1Controller.AdultList.length) +
              ((SearchViewRoundTrip_Controller.totalflightprice *
                  detailsView1Controller.ChildList.length));
    }
    return SingleChildScrollView(
      child: Container(
        // padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  Text(
                    'Credit card information',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  Text(
                    'Name of card holder',
                    style: TextStyle(
                        fontSize: 13,
                        color: AppColors.grayText,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                height: 45,
                child: TextFormField(
                  controller: Step3controller.cardHolderController,
                  decoration: textFielDecoratiom.copyWith(),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              const Row(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Card Number',
                    style: TextStyle(
                        fontSize: 13,
                        color: AppColors.grayText,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: Step3controller.cardNumberController,
                  decoration: textFielDecoratiom.copyWith(),
                  onChanged: (value) {},
                  validator: (value) {
                    if (value!.length < 10) {
                      return 'Please enter valid Card Number';
                    }
                    return null;
                  },
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 140,
                    padding: EdgeInsetsDirectional.only(top: 30),
                    child: Column(
                      children: [
                        Row(
                          children: const [
                            Text(
                              'Expiry Date (MM/yy)',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: AppColors.grayText,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                          child: Container(
                            width: 180,
                            child: TextFormField(
                              decoration: textFielDecoratiom.copyWith(),
                              controller: Step3controller.expiryDateController,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Expiry date is required';
                                }
                                final RegExp regex = RegExp(r'^\d{2}/\d{2}$');
                                if (!regex.hasMatch(value)) {
                                  return 'Invalid format. Please use MM/yy';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    padding: EdgeInsetsDirectional.only(top: 30),
                    width: 120,
                    child: Column(
                      children: [
                        Row(
                          children: const [
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              'CVV',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: AppColors.grayText,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: Step3controller.cvvController,
                            decoration: textFielDecoratiom.copyWith(),
                            onChanged: (value) {
                              // Handle any changes to the CVV input (if needed)
                            },
                            validator: (value) {
                              if (value!.length < 3) {
                                return 'Please enter a valid CVV';
                              }
                              return null;
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  GetBuilder<Step3Controller>(
                    init: Step3controller,
                    builder: (Step3Controller) => Container(
                      padding: EdgeInsets.only(top: 0, left: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        // border: Border.all(
                        //   color: Colors.grey,
                        //   width: 1.0,
                        // ),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: Step3Controller.Currency,
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              Step3Controller.updateFromCurrency(newValue);
                              convert(
                                  currencyController.selectedCurrency.value,
                                  Step3Controller.Currency,
                                  totalPriceTicketFlight);
                            }
                          },
                          items: Step3Controller.currencies
                              .map<DropdownMenuItem<String>>(
                            (String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(color: AppColors.grayText),
                                ),
                              );
                            },
                          ).toList(),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 60,
              ),
              Container(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: screenWidth(30),
                        top: screenHeight(86),
                        bottom: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Total to be paid:',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(
                              'Total flight ticket:',
                              style: TextStyle(
                                fontSize: screenWidth(26),
                                color: AppColors.grayText,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  '${convert(currencyController.selectedCurrency.value, Step3controller.Currency, totalPriceTicketFlight)}',
                                  style: TextStyle(
                                    fontSize: screenWidth(26),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  cerrency(currencyController
                                      .selectedCurrency.value),
                                  style: TextStyle(
                                    fontSize: screenWidth(24),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              'Total extra baggage:',
                              style: TextStyle(
                                fontSize: screenWidth(26),
                                color: AppColors.grayText,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  '${convert(currencyController.selectedCurrency.value, Step3controller.Currency, totalAmountExtraBaggage)}',
                                  style: TextStyle(
                                    fontSize: screenWidth(26),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  cerrency(currencyController
                                      .selectedCurrency.value),
                                  style: TextStyle(
                                    fontSize: screenWidth(24),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                        Row(
                          children: [
                            Text(
                              'Total amount:',
                              style: TextStyle(
                                fontSize: screenWidth(26),
                                color: AppColors.grayText,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  '${convert(currencyController.selectedCurrency.value, Step3controller.Currency, totalAmountExtraBaggage + totalPriceTicketFlight)}',
                                  style: TextStyle(
                                    fontSize: screenWidth(26),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  cerrency(currencyController
                                      .selectedCurrency.value),
                                  style: TextStyle(
                                    fontSize: screenWidth(24),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  double convert(String from, String to, double amount) {
    //
    double totalPriceTicketFlight = 0;
    double result =
        totalPriceTicketFlight * detailsView1Controller.AdultList.length;

    if (SearchViewOneWay_Controller.totalpriceflight != 0) {
      totalPriceTicketFlight = SearchViewOneWay_Controller.totalpriceflight;
    } else if (SearchViewRoundTrip_Controller.totalflightprice != 0) {
      totalPriceTicketFlight = SearchViewRoundTrip_Controller.totalflightprice;
    }

    Map<String, double> rates = {
      'AED': 3.67,
      'KWD': 0.30,
      'BHD': 0.38,
      'EUR': 0.85,
      'GBP': 0.75,
      'USD': 1.00,
      'INR': 74.25,
      'OMR': 0.39,
    };

    double amountInUsd = amount / rates[from]!;

    double convertedAmount = amountInUsd * rates[to]!;
    setState(() {
      result = convertedAmount;
      amount = convertedAmount;
    });

    String resultAsString = convertedAmount.toStringAsFixed(2);

    double finalResult = double.parse(resultAsString);

    return finalResult;
  }

  String cerrency(String cerrency) {
    String cerrency = '';
    final Step3Controller Step3_Controller = Get.put(Step3Controller());
    CurrencyController currencyController2 = Get.find<CurrencyController>();

    if (Step3_Controller.Currency != null) {
      setState(() {
        cerrency = Step3_Controller.Currency;
      });
    }

    return cerrency;
  }
}
