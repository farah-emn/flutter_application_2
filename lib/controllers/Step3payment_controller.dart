// ignore_for_file: deprecated_member_use, non_constant_identifier_names, unused_local_variable, avoid_print, unused_element, unnecessary_brace_in_string_interps
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:traveling/controllers/search_oneway_controller.dart';
import 'package:traveling/controllers/search_roundtrip_controller.dart';
import 'package:traveling/controllers/traveller_details_view1_controller.dart';
import 'package:traveling/controllers/currency_controller.dart';
import 'package:traveling/controllers/flight_info_controller.dart';

class Step3Controller extends GetxController {
  CurrencyController currencyController = Get.find<CurrencyController>();
  final TextEditingController cardHolderController = TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();
  TravellerDetailsView1Controller detailsViewController =
      Get.put(TravellerDetailsView1Controller());
  final TravellerDetailsView1Controller detailsView1Controller =
      Get.find<TravellerDetailsView1Controller>();
  final SearchViewOneWayController SearchViewOneWay_Controller =
      Get.find<SearchViewOneWayController>();
  final SearchViewRoundTripController SearchViewRoundTrip_Controller =
      Get.find<SearchViewRoundTripController>();
  double totalPriceTicketFlight = 0;

  String Currency = 'USD';
  final List<String> currencies = [
    'AED',
    'KWD',
    'BHD',
    'EUR',
    'GBP',
    'USD',
    'INR',
    'OMR'
  ];

  void updateFromCurrency(String newCurrency) {
    final FlightInfoController controller_flight =
        Get.find<FlightInfoController>();
    Currency = newCurrency;
    final TravellerDetailsView1Controller detailsView1Controller =
        Get.find<TravellerDetailsView1Controller>();
    double totalPriceTicketFlight =
        controller_flight.flightInfo.value.Flight_price;

    CurrencyController currencyController2 = Get.find<CurrencyController>();

    double result =
        totalPriceTicketFlight * detailsView1Controller.AdultList.length;
  }

  Future<bool> validateCreditCard() async {
    print(',nnnnmn');
    final String formattedExpiryDate =
        _getFormattedExpiryDate(expiryDateController.text);
    var collection = FirebaseFirestore.instance.collection('CreditCard');
    var docSnapshots = await collection.get();
    for (var docSnapshot in docSnapshots.docs) {
      Map<String, dynamic>? data = docSnapshot.data();

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
      double totalAmount = totalPriceTicketFlight + totalAmountExtraBaggage;
      if (data['CardNumber'] == cardNumberController.text &&
          data['expiryDate'] == formattedExpiryDate &&
          data['cvvCode'] == cvvController.text &&
          data['balance'] >= totalPriceTicketFlight &&
          data['cardholder name'] == cardHolderController.text &&
          data['currency'] == Currency) {
        data['balance'] = data['balance'] - totalAmount;

        await docSnapshot.reference.update({'balance': data['balance']});
        return true;
      }
    }
    return false;
  }

  String _getFormattedExpiryDate(String expiryDate) {
    final List<String> parts = expiryDate.split('/');
    if (parts.length >= 2) {
      final String expiryMonth = parts[0];
      final String expiryYear = parts[1];
      return '$expiryMonth/$expiryYear';
    } else {
      return '';
    }
  }

  void clearData() {
    cardHolderController.clear();
    cardNumberController.clear();
    expiryDateController.clear();
    cvvController.clear();
    Currency = 'USD';
    update();
  }
}
