// ignore_for_file: prefer_const_literals_to_create_immutables, sized_box_for_whitespace, prefer_const_constructors, avoid_unnecessary_containers, avoid_print, unnecessary_null_comparison, prefer_const_constructors_in_immutables, library_private_types_in_public_api, invalid_use_of_protected_member, non_constant_identifier_names, prefer_collection_literals, prefer_is_empty, unused_local_variable, unnecessary_brace_in_string_interps, prefer_final_fields, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_ocr_sdk/mrz_result.dart';
import 'package:get/get.dart';
import 'package:traveling/controllers/form_controller_RoundTrip.dart';
import 'package:traveling/controllers/traveller_details_view1_controller.dart';
import 'package:traveling/controllers/form_controller_oneWay.dart';
import 'package:traveling/controllers/search_oneway_controller.dart';
import 'package:traveling/controllers/search_roundtrip_controller.dart';
import 'package:traveling/controllers/traveller_details_view2_controller.dart';
import 'package:traveling/ui/shared/colors.dart';
import 'package:traveling/ui/shared/custom_widgets/custom_textfiled.dart';
import 'package:traveling/ui/shared/utils.dart';
import 'package:traveling/ui/views/traveller_side_views/traveller_details_view/scan_traveller_id/global.dart';
import 'package:traveling/ui/views/traveller_side_views/traveller_details_view/traveller_baggage.dart';
import 'package:traveling/ui/views/traveller_side_views/traveller_details_view/traveller_details_view2.dart';
import 'package:mrz_parser/mrz_parser.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TravellerDetailsView1 extends StatefulWidget {
  final ValueNotifier<bool>? isFormValid;
  final bool? change;
  String? type;

  TravellerDetailsView1({
    Key? key,
    this.type,
    required this.isFormValid,
    this.change,
  }) : super(key: key);

  @override
  _TravellerDetailsView1State createState() => _TravellerDetailsView1State();
}

class _TravellerDetailsView1State extends State<TravellerDetailsView1> {
  final TravellerDetails_Controller =
      Get.find<TravellerDetailsView1Controller>();
  final controller_oneway = Get.put(SearchViewOneWayController());
  final controller_roundtrip = Get.put(SearchViewRoundTripController());
  final FormController_RoundTrip = Get.put(FormControllerRoundTrip());
  final FormControllerOneWay FormController_oneway =
      Get.put(FormControllerOneWay());

  FormControllerOneWay FormControlleroneway = Get.find<FormControllerOneWay>();
  FormControllerRoundTrip FormControllerroundTrip =
      Get.find<FormControllerRoundTrip>();

  @override
  void initState() {
    super.initState();
    FormControlleroneway.formKey = GlobalKey<FormState>();
    FormControllerroundTrip.formKey = GlobalKey<FormState>();
    TravellerDetails_Controller.AdultList.clear();
    TravellerDetails_Controller.BaggageAdult.clear();
    TravellerDetails_Controller.BaggageChild.clear();

    TravellerDetails_Controller.ChildList.clear();
    final controller_TravellerDetailsView2 =
        Get.put(TravellerDetailsView2Controller());
  }

  late MRZResult receivedData;
  MrzResult? result;
  Future<int> loadData() async {
    return await initMRZSDK();
  }

  Set<int> selectedIndices = Set();
  Set<int> selectedIndices1 = Set();
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
        key: widget.type == 'oneway'
            ? FormControlleroneway.formKey
            : widget.type == 'RoundTrip'
                ? FormControllerroundTrip.formKey
                : null,
        child: Column(children: [
          Column(children: [
            Container(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Add traveller details',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: screenWidth(20),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenWidth(20),
                  ),
                  if (controller_oneway.Adultcounter == 1 ||
                      controller_roundtrip.Adultcounter == 1)
                    Container(
                      width: 400,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child: ListView.builder(
                        shrinkWrap: true,
                        // physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemCount: (controller_roundtrip.Adultcounter != 1)
                            ? controller_roundtrip.Adultcounter
                            : (controller_oneway.Adultcounter != 1)
                                ? controller_oneway.Adultcounter
                                : controller_roundtrip.Adultcounter,

                        itemBuilder: (context, index) {
                          bool isSelected = selectedIndices.contains(index);
                          return Container(
                            padding: EdgeInsetsDirectional.only(bottom: 10),
                            child: InkWell(
                                onTap: () {},
                                child: isSelected
                                    ? Container(
                                        color: AppColors.TextFieldcolor,
                                        child: Column(
                                          children: [
                                            Container(
                                              padding:
                                                  EdgeInsetsDirectional.only(
                                                      start: 10,
                                                      bottom: 10,
                                                      top: 10),
                                              width: size.width,
                                              color: AppColors.babyblueColor,
                                              child: Text(
                                                'Adult ${index + 1}',
                                                style: TextStyle(fontSize: 16),
                                              ),
                                            ),
                                            Container(
                                              padding:
                                                  EdgeInsetsDirectional.only(
                                                      start: 10,
                                                      bottom: 10,
                                                      top: 5,
                                                      end: 10),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          TravellerDetails_Controller
                                                                          .AdultList[
                                                                      index] !=
                                                                  null
                                                              ? TravellerDetails_Controller
                                                                      .AdultList[
                                                                          index]
                                                                      .givenName ??
                                                                  ''
                                                              : '',
                                                          textAlign:
                                                              TextAlign.right,
                                                        ),
                                                        Text(
                                                          TravellerDetails_Controller
                                                                          .AdultList[
                                                                      index] !=
                                                                  null
                                                              ? TravellerDetails_Controller
                                                                  .AdultList[
                                                                      index]
                                                                  .birthDate
                                                              : '',
                                                          style: TextStyle(
                                                              color: const Color
                                                                  .fromARGB(
                                                                  255,
                                                                  142,
                                                                  141,
                                                                  141)),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                      ],
                                                    ),
                                                    GestureDetector(
                                                        onTap: () async {
                                                          print(
                                                              TravellerDetails_Controller
                                                                  .AdultList);

                                                          result =
                                                              await Navigator
                                                                  .push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  TravellerDetailsView2(
                                                                change_data:
                                                                    TravellerDetails_Controller
                                                                            .AdultList[
                                                                        index],
                                                              ),
                                                            ),
                                                          );
                                                          if (result != null) {
                                                            setState(() {
                                                              if (TravellerDetails_Controller
                                                                          .AdultList[
                                                                      index] !=
                                                                  null) {
                                                                TravellerDetails_Controller
                                                                        .AdultList[
                                                                    index] = result;
                                                              }
                                                            });
                                                          }
                                                        },
                                                        child: Icon(
                                                          Icons
                                                              .keyboard_arrow_right_sharp,
                                                          color: AppColors
                                                              .TextgrayColor,
                                                        )),
                                                  ]),
                                            ),
                                            Container(
                                              padding:
                                                  EdgeInsetsDirectional.only(
                                                      end: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.luggage,
                                                        color: const Color
                                                            .fromARGB(
                                                            255, 215, 215, 215),
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                          'View / Add bugagge'),
                                                    ],
                                                  ),
                                                  GestureDetector(
                                                    onTap: () async {
                                                      print(index);
                                                      if (index <
                                                          TravellerDetails_Controller
                                                              .BaggageAdult
                                                              .value
                                                              .length) {
                                                        var resul =
                                                            await Navigator
                                                                .push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                TravellerBaggage(
                                                              Extrabaggage:
                                                                  TravellerDetails_Controller
                                                                      .BaggageAdult
                                                                      .value[index],
                                                            ),
                                                          ),
                                                        );

                                                        if (resul != null &&
                                                            resul.length >= 2) {
                                                          setState(() {
                                                            print(
                                                                TravellerDetails_Controller
                                                                    .BaggageAdult
                                                                    .value);
                                                            if (resul[1] ==
                                                                true) {
                                                              TravellerDetails_Controller
                                                                      .BaggageAdult
                                                                      .value[
                                                                  index] = resul[0];
                                                            } else {
                                                              TravellerDetails_Controller
                                                                  .addBaggageAdult(
                                                                      resul[0]);
                                                            }
                                                          });
                                                        }
                                                      } else {
                                                        var travellerbaggage =
                                                            await Navigator
                                                                .push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                TravellerBaggage(),
                                                          ),
                                                        );
                                                        print(travellerbaggage);
                                                        if (travellerbaggage !=
                                                                null &&
                                                            travellerbaggage
                                                                    .length >=
                                                                2) {
                                                          setState(() {
                                                            var ExtraBaggage =
                                                                travellerbaggage[
                                                                    0];

                                                            TravellerDetails_Controller
                                                                .addBaggageAdult(
                                                                    travellerbaggage[
                                                                        0]);
                                                          });
                                                        }
                                                      }
                                                    },
                                                    child: Icon(
                                                      Icons
                                                          .keyboard_arrow_right_sharp,
                                                      color: AppColors
                                                          .TextgrayColor,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ))
                                    : Container(
                                        width: 100,
                                        color: AppColors.TextFieldcolor,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                SizedBox(width: 10),
                                                Icon(
                                                  Icons.boy,
                                                  color:
                                                      AppColors.LightBlueColor,
                                                ),
                                                SizedBox(width: 10),
                                                Text(
                                                  'Adult ${index + 1}',
                                                  style: TextStyle(
                                                    color:
                                                        AppColors.TextgrayColor,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            IconButton(
                                              icon: Icon(
                                                Icons
                                                    .add_circle_outline_outlined,
                                                color: AppColors.IconBlueColor,
                                              ),
                                              onPressed: () async {
                                                if (index == 0) {
                                                  print(
                                                      TravellerDetails_Controller
                                                          .AdultList.length);

                                                  result = await Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          TravellerDetailsView2(),
                                                    ),
                                                  );
                                                  if (result != null) {
                                                    setState(() {
                                                      TravellerDetails_Controller
                                                              .AdultList
                                                          .add(result);
                                                      if (isSelected) {
                                                        selectedIndices
                                                            .remove(index);
                                                      } else {
                                                        selectedIndices
                                                            .add(index);
                                                      }
                                                    });
                                                  }
                                                } else if (index != null &&
                                                    TravellerDetails_Controller
                                                            .AdultList.length !=
                                                        0) {
                                                  result = await Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          TravellerDetailsView2(),
                                                    ),
                                                  );
                                                  if (result != null) {
                                                    setState(() {
                                                      TravellerDetails_Controller
                                                              .AdultList
                                                          .add(result);
                                                      // .addAdult(result!);
                                                      if (isSelected) {
                                                        selectedIndices
                                                            .remove(index);
                                                      } else {
                                                        selectedIndices
                                                            .add(index);
                                                      }
                                                    });
                                                  }
                                                } else {
                                                  Fluttertoast.showToast(
                                                      msg:
                                                          "Please add details for Adult ${index} first",
                                                      toastLength:
                                                          Toast.LENGTH_SHORT,
                                                      gravity:
                                                          ToastGravity.BOTTOM,
                                                      timeInSecForIosWeb: 1,
                                                      backgroundColor:
                                                          const Color.fromARGB(
                                                              255,
                                                              158,
                                                              165,
                                                              174),
                                                      textColor: Colors.white,
                                                      fontSize: 16.0);
                                                }
                                              },
                                            ),
                                          ],
                                        ),
                                      )),
                          );
                        },
                      ),
                    ),
                  if (controller_oneway.Childcounter != 0 ||
                      controller_roundtrip.Childcounter != 0)
                    Container(
                      width: 400,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child: ListView.builder(
                        shrinkWrap: true,
                        // physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemCount: (controller_roundtrip.Childcounter != 0)
                            ? controller_roundtrip.Childcounter
                            : (controller_oneway.Childcounter != 0)
                                ? controller_oneway.Childcounter
                                : 0,

                        // (controller_roundtrip.Childcounter != 1)
                        //     ? controller_roundtrip.Childcounter
                        //     : (controller_oneway.Childcounter != 1)
                        //         ? controller_oneway.Childcounter
                        //         : controller_roundtrip.Childcounter,

                        itemBuilder: (context, index) {
                          bool isSelected = selectedIndices1.contains(index);
                          return Container(
                            padding: EdgeInsetsDirectional.only(bottom: 10),
                            child: InkWell(
                                onTap: () {},
                                child: isSelected
                                    ? Container(
                                        color: AppColors.TextFieldcolor,
                                        child: Column(
                                          children: [
                                            Container(
                                              padding:
                                                  EdgeInsetsDirectional.only(
                                                      start: 10,
                                                      bottom: 10,
                                                      top: 10),
                                              width: size.width,
                                              color: AppColors.babyblueColor,
                                              child: Text(
                                                'Child ${index + 1}',
                                                style: TextStyle(fontSize: 16),
                                              ),
                                            ),
                                            Container(
                                              padding:
                                                  EdgeInsetsDirectional.only(
                                                      start: 10,
                                                      bottom: 10,
                                                      top: 5,
                                                      end: 10),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          TravellerDetails_Controller
                                                                          .ChildList[
                                                                      index] !=
                                                                  null
                                                              ? TravellerDetails_Controller
                                                                      .ChildList[
                                                                          index]
                                                                      .givenName ??
                                                                  ''
                                                              : '',
                                                          textAlign:
                                                              TextAlign.right,
                                                        ),
                                                        Text(
                                                          TravellerDetails_Controller
                                                                          .ChildList[
                                                                      index] !=
                                                                  null
                                                              ? TravellerDetails_Controller
                                                                  .ChildList[
                                                                      index]
                                                                  .birthDate
                                                              : '',
                                                          style: TextStyle(
                                                              color: const Color
                                                                  .fromARGB(
                                                                  255,
                                                                  142,
                                                                  141,
                                                                  141)),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                      ],
                                                    ),
                                                    GestureDetector(
                                                        onTap: () async {
                                                          print(
                                                              TravellerDetails_Controller
                                                                  .ChildList);

                                                          result =
                                                              await Navigator
                                                                  .push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  TravellerDetailsView2(
                                                                change_data:
                                                                    TravellerDetails_Controller
                                                                            .ChildList[
                                                                        index],
                                                              ),
                                                            ),
                                                          );
                                                          if (result != null) {
                                                            setState(() {
                                                              if (TravellerDetails_Controller
                                                                          .ChildList[
                                                                      index] !=
                                                                  null) {
                                                                TravellerDetails_Controller
                                                                        .ChildList[
                                                                    index] = result;
                                                              }
                                                            });
                                                          }
                                                        },
                                                        child: Icon(
                                                          Icons
                                                              .keyboard_arrow_right_sharp,
                                                          color: AppColors
                                                              .TextgrayColor,
                                                        )),
                                                  ]),
                                            ),
                                            Container(
                                              padding:
                                                  EdgeInsetsDirectional.only(
                                                      end: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.luggage,
                                                        color: const Color
                                                            .fromARGB(
                                                            255, 215, 215, 215),
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                          'View / Add bugagge'),
                                                    ],
                                                  ),
                                                  GestureDetector(
                                                    onTap: () async {
                                                      print(index);
                                                      if (index <
                                                          TravellerDetails_Controller
                                                              .BaggageChild
                                                              .value
                                                              .length) {
                                                        var resul =
                                                            await Navigator
                                                                .push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                TravellerBaggage(
                                                              Extrabaggage:
                                                                  TravellerDetails_Controller
                                                                      .BaggageChild
                                                                      .value[index],
                                                            ),
                                                          ),
                                                        );

                                                        if (resul != null &&
                                                            resul.length >= 2) {
                                                          setState(() {
                                                            print(
                                                                TravellerDetails_Controller
                                                                    .BaggageChild
                                                                    .value);
                                                            if (resul[1] ==
                                                                true) {
                                                              TravellerDetails_Controller
                                                                      .BaggageChild
                                                                      .value[
                                                                  index] = resul[0];
                                                            } else {
                                                              TravellerDetails_Controller
                                                                  .addBaggageChild(
                                                                      resul[0]);
                                                            }
                                                          });
                                                        }
                                                      } else {
                                                        var travellerbaggage =
                                                            await Navigator
                                                                .push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                TravellerBaggage(),
                                                          ),
                                                        );
                                                        print(travellerbaggage);
                                                        if (travellerbaggage !=
                                                                null &&
                                                            travellerbaggage
                                                                    .length >=
                                                                2) {
                                                          setState(() {
                                                            var ExtraBaggage =
                                                                travellerbaggage[
                                                                    0];

                                                            TravellerDetails_Controller
                                                                .addBaggageChild(
                                                                    travellerbaggage[
                                                                        0]);
                                                          });
                                                        }
                                                      }
                                                    },
                                                    child: Icon(
                                                      Icons
                                                          .keyboard_arrow_right_sharp,
                                                      color: AppColors
                                                          .TextgrayColor,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ))
                                    : Container(
                                        width: 100,
                                        color: AppColors.TextFieldcolor,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                SizedBox(width: 10),
                                                Icon(
                                                  Icons.boy,
                                                  color:
                                                      AppColors.LightBlueColor,
                                                ),
                                                SizedBox(width: 10),
                                                Text(
                                                  'Child ${index + 1}',
                                                  style: TextStyle(
                                                    color:
                                                        AppColors.TextgrayColor,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            IconButton(
                                              icon: Icon(
                                                Icons
                                                    .add_circle_outline_outlined,
                                                color: AppColors.IconBlueColor,
                                              ),
                                              onPressed: () async {
                                                if (index == 0) {
                                                  print(
                                                      TravellerDetails_Controller
                                                          .ChildList.length);

                                                  result = await Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          TravellerDetailsView2(),
                                                    ),
                                                  );
                                                  if (result != null) {
                                                    setState(() {
                                                      TravellerDetails_Controller
                                                              .ChildList
                                                          .add(result);
                                                      if (isSelected) {
                                                        selectedIndices1
                                                            .remove(index);
                                                      } else {
                                                        selectedIndices1
                                                            .add(index);
                                                      }
                                                    });
                                                  }
                                                } else if (index != null &&
                                                    TravellerDetails_Controller
                                                            .ChildList.length !=
                                                        0) {
                                                  result = await Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          TravellerDetailsView2(),
                                                    ),
                                                  );
                                                  if (result != null) {
                                                    setState(() {
                                                      TravellerDetails_Controller
                                                              .ChildList
                                                          .add(result);
                                                      // .addAdult(result!);
                                                      if (isSelected) {
                                                        selectedIndices1
                                                            .remove(index);
                                                      } else {
                                                        selectedIndices1
                                                            .add(index);
                                                      }
                                                    });
                                                  }
                                                } else {
                                                  Fluttertoast.showToast(
                                                      msg:
                                                          "Please add details for Child ${index} first",
                                                      toastLength:
                                                          Toast.LENGTH_SHORT,
                                                      gravity:
                                                          ToastGravity.BOTTOM,
                                                      timeInSecForIosWeb: 1,
                                                      backgroundColor:
                                                          const Color.fromARGB(
                                                              255,
                                                              158,
                                                              165,
                                                              174),
                                                      textColor: Colors.white,
                                                      fontSize: 16.0);
                                                }
                                              },
                                            ),
                                          ],
                                        ),
                                      )),
                          );
                        },
                      ),
                    ),
                  SizedBox(
                    height: screenWidth(20),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                        top: screenWidth(20),
                        end: screenWidth(10),
                        bottom: screenWidth(20)),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Contact details',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: screenWidth(20),
                          ),
                        )),
                  ),
                  CustomTextField(
                    prefIcon: Icons.person_2,
                    colorIcon: AppColors.pinkColor2,
                    hintText: 'First name',
                    validator: (value) {
                      if (value!.length < 10) {
                        return 'Please enter valid mobile number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    prefIcon: Icons.person_2,
                    colorIcon: AppColors.pinkColor2,
                    hintText: 'Last name',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    prefIcon: Icons.email,
                    colorIcon: Color.fromARGB(255, 200, 186, 248),
                    hintText: 'Email',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: screenWidth(7),
                  ),
                ],
              ),
            )
          ])
        ]));
  }
}
