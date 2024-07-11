

import 'package:e_comm/screens/auth-ui/sign-in-screen.dart';
import 'package:e_comm/screens/auth-ui/sign-up-screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../controllers/google-sign-in-controller.dart';
import '../../utils/app-constant.dart';

class WelcomeScreen extends StatelessWidget {
   WelcomeScreen({super.key});

  final GoogleSignInController _googleSignInController =
  Get.put(GoogleSignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppConstant.appScendoryColor,
        title: Text(
            "Welcome to My App",
        style: TextStyle(
            color: AppConstant.appTextColor)
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: AppConstant.appScendoryColor,
              child: Lottie.asset('assets/images/splash-icon.json'),
            ),

            Container(
              margin: EdgeInsets.only(top:35),
              child: Text(
                  "Happy Shopping",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
              ),
            ),
            SizedBox(
              height: Get.height / 17,
            ),


            Material(
              child: Container(
                width: Get.width / 1.2,
                height: Get.height / 12,
                decoration: BoxDecoration(
                  color: AppConstant.appScendoryColor,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: TextButton.icon(
                    icon: Image.asset('assets/images/final-google-logo.png',
                    width: Get.width / 12,
                      height: Get.height / 12,
                    ),
                    label: Text(
                        "Sign in with google",
                    style: TextStyle(
                      color: AppConstant.appTextColor,
                    ),
                    ),
                  onPressed:(){
                    _googleSignInController.signInWithGoogle();
                  },
                ),
              ),
              ),

            SizedBox(
              height: Get.height / 40,
            ),

            Material(
              child: Container(
                width: Get.width / 1.2,
                height: Get.height / 12,
                decoration: BoxDecoration(
                  color: AppConstant.appScendoryColor,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: TextButton.icon(
                  icon: Icon(
                      Icons.email,
                    color: AppConstant.appTextColor,
                  ),
                  label: Text(
                    "Sign in with Email",
                    style: TextStyle(
                      color: AppConstant.appTextColor,
                    ),
                  ),
                  onPressed:(){
                    Get.to(() =>SignInScreen());
                  },
                ),
              ),
            ),
       ],
        ),
     ),
    );
  }
}
