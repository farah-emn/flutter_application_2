import 'package:flutter/material.dart';

import '../colors.dart';

const textFielDecoratiom = InputDecoration(
  // hintStyle: TextStyle(fontSize: 15, color: AppColors.TextgrayColor),
  errorBorder: UnderlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15)),
    borderSide: BorderSide(color: Colors.red, width: 1.5),
  ),
  prefixIconColor: AppColors.mainColorBlue,
  filled: true,
  fillColor: AppColors.backgroundgrayColor,
  labelStyle: TextStyle(fontSize: 18, color: AppColors.grayText),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(20),
    ),
  ),
  enabledBorder: UnderlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15)),
    borderSide: BorderSide(
      color: AppColors.TextgrayColor,
    ),
  ),
  focusedBorder: UnderlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15)),
    borderSide: BorderSide(color: AppColors.mainColorBlue, width: 1.5),
  ),
  disabledBorder: UnderlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15)),
    borderSide: BorderSide(color: AppColors.grayText),
  ),
  focusedErrorBorder: UnderlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15)),
    borderSide: BorderSide(color: Colors.red, width: 1.5),
  ),
);
