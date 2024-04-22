// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:traveling/components/hotelDetailsBody.dart';
import 'package:traveling/core/data/repository/post_repository.dart';
import 'package:traveling/core/data/repository/prodcut_repository.dart';
import 'package:traveling/core/data/repository/shared_prefrence_repository.dart';
import 'package:traveling/core/services/connectivity_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:traveling/ui/views/hotel_views/booking_summary_view/bookingSummaryScreen.dart';
import 'package:traveling/ui/views/hotel_views/hotel_details_view/hotelDetailsScreen.dart';
import 'package:traveling/ui/views/hotel_views/hotel_Info_view/hotelInfoScreen.dart';

import 'app/my_app.dart';

late SharedPreferences prefs;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCNAmw7EMRSuR2_fG40x08QbvWl8yH_6kg",
      appId: "1:969124608869:android:33cc44f88cb8edb3c9bf8c",
      messagingSenderId: '969124608869',
      projectId: "travelling-1255c",
      storageBucket: 'travelling-1255c.appspot.com',
    ),
  );
  Get.lazyPut(() => SharedPrefrenceRepository());
  Get.lazyPut(() => PostRepository());
  Get.lazyPut(() => ProductRepository());

  await Get.putAsync(() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs;
  });

//   // Get.put(ConnectivityService());
//   // Get.put(Connectivity());

  runApp(MyApp());
}
