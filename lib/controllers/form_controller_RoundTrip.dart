import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormControllerRoundTrip extends GetxController {
  late GlobalKey<FormState> formKey;

  final RxString formValue = ''.obs;

  bool validateForm() {
    final form = formKey.currentState;
    if (form!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  void resetForm() {
    formKey.currentState!.reset();
    formKey.currentState!.reset();
    print(formKey.currentState!);
  }
}
