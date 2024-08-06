

import 'package:e_comm/screens/auth-ui/welcome-screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../utils/app-constant.dart';
import '../../widgets/banner-widget.dart';
import '../../widgets/category-widget.dart';
import '../../widgets/custom-drawer-widget.dart';
import '../../widgets/flash-sale-widget.dart';
import '../../widgets/heading-widget.dart';
import 'all-categories-screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppConstant.appTextColor) ,
        backgroundColor: AppConstant.appMainColor,
        title: Text("Homely",
        style: TextStyle(
            color: AppConstant.appTextColor,
        ),
        ),
        centerTitle: true,
      ),
      drawer: DrawerWidget(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: Get.height / 90.0,
              ),
              //banners
              BannerWidget(),
              HeadingWidget(
                headingTitle: "Categories",
                headingSubTitle: "According to your budget",
                onTap: (){
                  Get.to(() => AllCategoriesScreen());
                },
                buttonText: "See More >",
              ),

              CategoriesWidget(),

              HeadingWidget(
                headingTitle: "Flash Sale",
                headingSubTitle: "According to your budget",
                onTap: (){},
                buttonText: "See More >",
              ),

              FlashSaleWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
