import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../config/app_styles.dart';



PreferredSizeWidget makeAppBar({title}) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.white,
    centerTitle: true,
    automaticallyImplyLeading: false,
    title: Text(title,style: AppStyles.black18W6Style,),
    leading: IconButton(
      onPressed: () {
        Get.back();
      },
      icon: const Icon(Icons.arrow_back_ios, size: 20, color: Colors.black,),
    ),
  );
}