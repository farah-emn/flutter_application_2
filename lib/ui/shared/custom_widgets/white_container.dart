import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:traveling/ui/shared/colors.dart';
import 'package:traveling/ui/shared/utils.dart';

BoxDecoration decoration = BoxDecoration(
  color: Colors.white,
  border:
      Border.all(color: Color.fromARGB(255, 223, 229, 232), width: 0.5),
  // boxShadow: List.filled(
  //   10,

  //   const BoxShadow(
  //       color: AppColors.gray,
  //       blurRadius: BorderSide.strokeAlignOutside,
  //       blurStyle: BlurStyle.outer),
  // ),
  borderRadius: const BorderRadius.all(
    Radius.circular(20),
  ),
);
