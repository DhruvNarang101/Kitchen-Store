

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import '../utils/app-constant.dart';

class GetDeviceTokenController extends GetxController {
  String? deviceToken;


  void onInit(){
    super.onInit();
    getDeviceToken();
  }

  Future<void> getDeviceToken() async {
    try{
      // use to get the device token FirebaseMessaging is a package
      // device token store in the token.
      String? token = await FirebaseMessaging.instance.getToken();

      if(token != null){
        deviceToken = token;
        // add token in the deviceToken.
        print("Token : $deviceToken");
        update();
      }
    } catch(e){
      Get.snackbar(
        "Error",
        "$e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppConstant.appScendoryColor,
        colorText: AppConstant.appTextColor,
      );
    }
  }
}