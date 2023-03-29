import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';

import '../config/app_colors.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class Utils {
  static void showErrorText(String text) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
  static void showSuccessText(String text) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  static bool validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return false;
    }
    return true;
  }
  static bool validateInput(String value) {
    if (value.isEmpty) {
      return false;
    }
    return true;
  }

  static bool validatePassword(String value) {
    if (value.length < 6) {
      return false;
    }
    return true;
  }

  static void confirmDialog(Function() onConfirm,Function() onCancel){
    Get.defaultDialog(
      title: "Êtes-vous sûr de vouloir vous déconnecter",
      titleStyle: const TextStyle(fontSize: 18.0),
      backgroundColor: AppColors.whiteColor,
      middleText: "",
      radius: 15.0,
      textConfirm: "Oui",
      textCancel: "Non",
      cancelTextColor: AppColors.redColor,
      confirmTextColor: AppColors.whiteColor,
      onConfirm:onConfirm,
      onCancel: onCancel,

    );
  }
}