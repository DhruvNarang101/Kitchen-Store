

import 'dart:async';

import 'package:e_comm/screens/auth-ui/sign-in-screen.dart';
import 'package:e_comm/screens/auth-ui/welcome-screen.dart';
import 'package:e_comm/screens/user-panel/main-screen.dart';
import 'package:e_comm/utils/app-constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../controllers/get-user-data-controller.dart';
import '../admin-panel/admin-main-screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 1),(){
      loggdin(context);
    });
  }

  Future<void> loggdin(BuildContext context) async {
    if(user != null){
      final GetUserDataController getUserDataController =
      Get.put(GetUserDataController());
      var userData = await getUserDataController.getUserData(user!.uid);

      if(userData[0]['isAdmin'] == true){
        Get.offAll(() =>AdminMainScreen());
      } else{
        Get.offAll(() => MainScreen());
      }
    } else {
      Get.to(() => WelcomeScreen());
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstant.appMainColor,
      appBar: AppBar(
        backgroundColor: AppConstant.appMainColor,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: Get.width,
                alignment: Alignment.center,
                child: Lottie.asset('assets/images/splash-icon.json'),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 23.0),
              width: Get.width,
              alignment: Alignment.center,
              child: Text(
                AppConstant.appPoweredBy,
                style: TextStyle(
                  color: AppConstant.appTextColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
