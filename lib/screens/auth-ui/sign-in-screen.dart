

import 'package:e_comm/screens/auth-ui/sign-up-screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../controllers/get-user-data-controller.dart';
import '../../controllers/sign-in-controller.dart';
import '../../utils/app-constant.dart';
import '../admin-panel/admin-main-screen.dart';
import '../user-panel/main-screen.dart';
import 'forget-password-screen.dart';
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GetUserDataController getUserDataController = Get.put(GetUserDataController());
  final SignInController signInController = Get.put(SignInController());
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible){
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppConstant.appScendoryColor,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Sign In",
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
                  " Happy Shopping ",
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

              Container(
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Obx( () => TextFormField(
                    controller: userPassword,
                    obscureText: signInController.isPasswordVisible.value,
                    cursorColor: AppConstant.appScendoryColor,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      hintText: "Password",
                      prefixIcon: Icon(Icons.password),
                      suffixIcon: GestureDetector(
                        onTap: (){
                          signInController.isPasswordVisible.toggle();
                        },
                          child: signInController.isPasswordVisible.value?
                          Icon(Icons.visibility_off) : Icon(Icons.visibility)
                      ),
                      contentPadding: EdgeInsets.only(top: 2.0, left: 8.0),
                      border: OutlineInputBorder(
                        borderRadius:BorderRadius.circular(10.0),
                      ),
                    ),
                  ),)
                ),
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: (){
                    Get.to(() => ForgetPasswordScreen());
                  },
                  child: Text(
                      "Forget Password?",
                    style: TextStyle(
                      color: AppConstant.appScendoryColor,
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
                      "Sign In",
                      style: TextStyle(
                        color: AppConstant.appTextColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed:() async {
                      String email = userEmail.text.trim();
                      String password = userPassword.text.trim();

                      if(email.isEmpty || password.isEmpty){
                        Get.snackbar("Error", "Please Enter all Details",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: AppConstant.appScendoryColor,
                            colorText: AppConstant.appTextColor,
                        );
                      } else {
                        UserCredential? userCredential = await signInController
                            .signInMethod(email,
                            password);

                       var userData = await getUserDataController
                           .getUserData(userCredential!.user!.uid);

                        if(userCredential != null){
                          if(userCredential.user!.emailVerified){

                            //
                            if(userData[0]['isAdmin'] == true){
                              Get.offAll(()=> AdminMainScreen());
                              Get.snackbar("Success Admin Login",
                                "Login Successfully",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: AppConstant.appScendoryColor,
                                colorText: AppConstant.appTextColor,
                              );
                              Get.offAll(()=> AdminMainScreen());
                            } else {
                              Get.offAll(() => MainScreen());
                              Get.snackbar("Success User Login",
                                "Login Successfully",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: AppConstant.appScendoryColor,
                                colorText: AppConstant.appTextColor,
                              );
                            }
                          } else {
                            Get.snackbar("Error","Please Verify your email",
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: AppConstant.appScendoryColor,
                              colorText: AppConstant.appTextColor,
                            );
                          }
                        }
                        else{
                          Get.snackbar("Error","Please try again",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: AppConstant.appScendoryColor,
                            colorText: AppConstant.appTextColor,
                          );
                        }
                      }
                    },
                  ),
                ),
              ),

              SizedBox(
                height: Get.height / 20,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(
                      color: AppConstant.appScendoryColor,
                    ),
                  ),

                  GestureDetector(
                    onTap: () => Get.offAll(() => SignUpScreen()),
                  child: Text(
                    "Sign Up ",
                    style: TextStyle(
                      color: AppConstant.appScendoryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ),
              ],)
            ],
          ),
        ),
      ),
      );
    });
  }
}
