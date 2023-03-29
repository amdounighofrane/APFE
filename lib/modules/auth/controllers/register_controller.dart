import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../config/app_constants.dart';
import '../../../data/models/users_model.dart';
import '../../../helper/base_controller.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/utils.dart';
import '../../../widgets/bottom_sheet.dart';
import 'package:intl/intl.dart';

class RegisterController extends GetxController with BaseController {
  late TextEditingController full_name, adress, phoneNumber, email_field, password,
      confirmPassword;
  var imageURL = ''.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  RxBool selectedTerms = false.obs;


  @override
  void onInit() {
    super.onInit();
    full_name = TextEditingController();
    adress = TextEditingController();
    phoneNumber = TextEditingController();
    email_field = TextEditingController();
    password = TextEditingController();
    confirmPassword = TextEditingController();
  }


  @override
  void onReady() {
    super.onReady();
  }

  registerUser() async {

    if (!Utils.validateInput(full_name.text)) {
      Utils.showErrorText("First Name Required");
      return;
    }
    if (!Utils.validateInput(adress.text)) {
      Utils.showErrorText("Last name is required");
      return;
    }
    if (!Utils.validateInput(phoneNumber.text)) {
      Utils.showErrorText("phone number required");
      return;
    }
    if (!Utils.validatePassword(email_field.text)) {
      Utils.showErrorText("Please provide your valid email address.");
      return;
    }
    if (!Utils.validatePassword(password.text)) {
      Utils.showErrorText("Password must be 6 characters long");
      return;
    }
    if (!(password.text == confirmPassword.text)) {
      Utils.showErrorText("Password must be the same");
      return;
    }
    if (!Utils.validateInput(imageURL.value)) {
      Utils.showErrorText("You must select the image.");
      return;
    }
    if (selectedTerms.value==false) {
      Utils.showErrorText("You must agree to the terms of use.");
      return;
    }
    showLoading();
    String date = DateTime.now().toIso8601String();
    var user = UsersModel(
      uid: '',
      adresse: adress.text.trim(),
      email: email_field.text.trim(),
      fullName: full_name.text.trim(),
      photoUrl: imageURL.value,
      phoneNumber:phoneNumber.text.trim(),
      isApproved: false,
      creationTime: DateFormat.yMMMMd('en_US').format(DateTime.parse(date)),

    );
    FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email_field.text.trim(),
      password: password.text.trim(),

    ).then((value) async =>{
      user.uid = FirebaseAuth.instance.currentUser?.uid,
      await FirebaseAuth.instance.currentUser?.updateProfile(displayName:full_name.text.trim(),photoURL: imageURL.value ),
      FirebaseFirestore.instance
          .collection(AppConstants.COLLECTION_USERS)
          .doc(user.uid)
          .set(user.toJson())
          .then((value) => {
      hideLoading(),
        Utils.showSuccessText("You have successfully registered, wait for the administrator to approve your request."),
        Get.back()
      })
    });

  }

  chooseSourceUploadPicture(BuildContext context) async {
    BottomSheetHelper.addPictureBottomSheet((index) =>

    {
      Get.back(),
      uploadImage(index)
    });

  }

  uploadImage(int index) async {
    print("hello moussa");
    final _firebaseStorage = FirebaseStorage.instance;
    final _imagePicker = ImagePicker();
    PickedFile image;
    await Permission.photos.request();
    var permissionStatus = await Permission.photos.status;
    if (true){
      if(index==0){
        image = (await _imagePicker.getImage(source: ImageSource.gallery))!;
      }else{
        image = (await _imagePicker.getImage(source: ImageSource.camera))!;
      }
      var file = File(image.path);
      if (image != null){
        int timestamp = DateTime.now().millisecondsSinceEpoch;
        showLoading();
        var snapshot = await _firebaseStorage.ref()
            .child('images/$timestamp')
            .putFile(file).whenComplete(() => {

        });
        var downloadUrl = await snapshot.ref.getDownloadURL();
        imageURL.value = downloadUrl;
        hideLoading();
      } else {

      }
    } else {
    }
  }

}