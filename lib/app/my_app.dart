import 'package:bot_toast/bot_toast.dart';
import 'package:traveling/ui/views/main_view/home_view/home_view.dart';
import 'package:traveling/ui/views/main_view/main_view.dart';
import 'package:traveling/ui/views/signup_view/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:traveling/app/my_app_controller.dart';
import 'package:traveling/core/data/repository/shared_prefrence_repository.dart';
import 'package:traveling/core/services/connectivity_service.dart';
import 'package:traveling/core/translation/app_translation.dart';
import 'package:traveling/ui/shared/utils.dart';
import 'package:traveling/ui/views/traveller_details_view/traveller_details_view.dart';
import 'package:traveling/ui/views/traveller_details_view/traveller_details_view2.dart';
import 'package:traveling/ui/views/traveller_details_view/traveller_details_view3.dart';


class MyApp extends StatelessWidget {
  MyApp({super.key});

  MyAppController controller = Get.put(MyAppController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: getLocal(),
      translations: AppTranslation(),
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      builder: BotToastInit(), //1. call BotToastInit
      navigatorObservers: [BotToastNavigatorObserver()],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignUpView(),
    );
  }
}

Locale getLocal() {
  String langCode = SharedPrefrenceRepository().getAppLanguge();

  if (langCode == 'ar')
    return Locale('ar', 'SA');
  else if (langCode == 'en')
    return Locale('en', 'US');
  else
    return Locale('fr', 'FR');
}



//Get.toNamed('/details');