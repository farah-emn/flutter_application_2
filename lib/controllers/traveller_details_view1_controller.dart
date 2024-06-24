import 'package:get/get.dart';

enum BaggageOption { option15kg, option20kg, option25kg }

class TravellerDetailsView1Controller extends GetxController {
  var AdultList = <dynamic>[].obs;
  var BaggageAdult = <dynamic>[].obs;
  var ChildList = <dynamic>[].obs;
  var BaggageChild = <dynamic>[].obs;

  void addBaggageAdult(dynamic result) {
    BaggageAdult.add(result);
  }

  void addAdult(dynamic result) {
    AdultList.add(result);
  }

  void addChild(dynamic child) {
    AdultList.add(child);
  }

  void addBaggageChild(dynamic baggage) {
    BaggageChild.add(baggage);
  }

  void clearData() {
    AdultList.clear();
    BaggageAdult.clear();
    ChildList.clear();
    BaggageChild.clear();
    update();
  }
}
