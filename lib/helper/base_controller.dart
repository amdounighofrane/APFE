
import 'package:get/get.dart';
import 'dialog_helper.dart';

class BaseController {
  var email = ''.obs;
  var fullName = ''.obs;
  var image = ''.obs;

  showLoading() {
    DialogHelper.showLoading();
  }

  hideLoading() {
    DialogHelper.hideLoading();
  }
}