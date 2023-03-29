import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/app_colors.dart';
import '../config/app_styles.dart';

class BottomSheetHelper {
  //show bottomsheet
  static void addPictureBottomSheet(Function(int index) onPressed) {
    Get.bottomSheet(
      isDismissible: true,
      backgroundColor: Colors.transparent,
      Container(
        height: 175.0,
        color: Colors.transparent, //could change this to Color(0xFF737373),
        //so you don't have to change MaterialApp canvasColor
        child:  Container(
            decoration:  const BoxDecoration(
                color: Colors.white,
                borderRadius:  BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0))),
            child:  Container(
              margin: const EdgeInsets.fromLTRB(25, 25, 25, 0),
              child: Column(
                children: [
                  Text("Upload picture",style: AppStyles.black18W6Style,),
                  const SizedBox(height: 10,),
                  GestureDetector(
                    onTap:()=> {onPressed(0)},
                    child: Row(
                      children: [
                        const Icon(Icons.folder_copy,color: AppColors.primaryColor,size: 25,),
                        const SizedBox(width: 20,),
                        Text("Gallery",style: AppStyles.black14W5Style,)
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  GestureDetector(
                    onTap:()=> {onPressed(1)},
                    child: Row(
                      children: [
                        const Icon(Icons.camera_alt_rounded,color: AppColors.primaryColor,size: 25,),
                        const SizedBox(width: 20,),
                        Text("Camera",style: AppStyles.black14W5Style,)
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}