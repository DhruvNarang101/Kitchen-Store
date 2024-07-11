

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../controllers/forget-password-controller.dart';
import '../../utils/app-constant.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final ForgetPasswordController forgetPasswordController = Get.put(ForgetPasswordController());
  TextEditingController userEmail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible){
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppConstant.appScendoryColor,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Forget Password",
            style: TextStyle(
              color: AppConstant.appTextColor,
            ),
          ),
        ),

        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            child: Column(
              children: [
                isKeyboardVisible
                    ? Text(
                  " Forget your Password ",
                  style: TextStyle(
                    color: AppConstant.appScendoryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.5,
                  ),
                ):
                Container(
                  color: AppConstant.appScendoryColor,
                  child: Column(
                    children: [
                      Lottie.asset('assets/images/splash-icon.json'),
                    ],
                  ),
                ),

                SizedBox(
                  height: Get.height / 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: userEmail,
                      cursorColor: AppConstant.appScendoryColor,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "Email",
                        prefixIcon: Icon(Icons.email),
                        contentPadding: EdgeInsets.only(top: 2.0, left: 8.0),
                        border: OutlineInputBorder(
                          borderRadius:BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: Get.height / 20,
                ),

                Material(
                  child: Container(
                    width: Get.width / 2.7,
                    height: Get.height / 22,
                    decoration: BoxDecoration(
                      color: AppConstant.appScendoryColor,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: TextButton(
                      child: Text(
                        "Forget",
                        style: TextStyle(
                          color: AppConstant.appTextColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed:() async {
                        String email = userEmail.text.trim();

                        if(email.isEmpty){
                          Get.snackbar("Error", "Please Enter email",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: AppConstant.appScendoryColor,
                            colorText: AppConstant.appTextColor,
                          );
                        } else{
                          String email = userEmail.text.trim();
                          forgetPasswordController.ForgetPasswordMethod(email);
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
