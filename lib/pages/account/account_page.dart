// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:food_delivery_dbestech/base/custom_loader.dart';
import 'package:food_delivery_dbestech/controllers/auth-controller.dart';
import 'package:food_delivery_dbestech/controllers/user_controller.dart';
import 'package:food_delivery_dbestech/routes/route_helper.dart';
import 'package:food_delivery_dbestech/utils/colors.dart';
import 'package:food_delivery_dbestech/widgets/account_widget.dart';
import 'package:food_delivery_dbestech/widgets/app_icon.dart';
import 'package:food_delivery_dbestech/widgets/big_text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _userLoggedIn = Get.find<AuthController>().userLoggedIn();
    if (_userLoggedIn) {
      Get.find<UserController>().getUserInfo();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: Center(
          child: BigText(
            text: "Profile",
            size: 24,
            color: Colors.white,
          ),
        ),
      ),



      // body: GetBuilder<UserController>(builder: (userController){
        // return _userLoggedIn?
        // (userController.isLoading?

      body:
       Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            // profile icon
            AppIcon(
              icon: Icons.person,
              backgroundColor: AppColors.mainColor,
              iconColor: Colors.white,
              iconSize: 75,
              size: 130,
            ),

            SizedBox(
              height: 30,
            ),
            //name
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.person,
                          backgroundColor: AppColors.mainColor,
                          iconColor: Colors.white,
                          iconSize: 23,
                          size: 40,
                        ),
                        bigText: BigText(text: "Hasti")),
                    SizedBox(
                      height: 30,
                    ),
                    //============phone==============
                    AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.phone,
                          backgroundColor: AppColors.yellowColor,
                          iconColor: Colors.white,
                          iconSize: 23,
                          size: 40,
                        ),
                        bigText: BigText(
                          text: "9925503530",
                        )),
                    SizedBox(
                      height: 30,
                    ),
                    //===========email=============
                    AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.email_outlined,
                          backgroundColor: AppColors.yellowColor,
                          iconColor: Colors.white,
                          iconSize: 23,
                          size: 40,
                        ),
                        bigText: BigText(
                          text: "hastim@gmail.com",
                        )),
                    SizedBox(
                      height: 30,
                    ),
                    //==============address=============
                    AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.location_on,
                          backgroundColor: AppColors.yellowColor,
                          iconColor: Colors.white,
                          iconSize: 23,
                          size: 40,
                        ),
                        bigText: BigText(
                          text: "Fill in your address",
                        )),
                    SizedBox(
                      height: 30,
                    ),
                    //========message===========
                    AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.message,
                          backgroundColor: Colors.redAccent,
                          iconColor: Colors.white,
                          iconSize: 23,
                          size: 40,
                        ),
                        bigText: BigText(
                          text: "Messages",
                        )),
                    SizedBox(
                      height: 30,
                    ),
                    AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.payment,
                          backgroundColor: Colors.grey,
                          iconColor: Colors.white,
                          iconSize: 23,
                          size: 40,
                        ),
                        bigText: BigText(
                          text: "Payement",
                        )),
                    SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        // if(Get.find<AuthController>().userLoggedIn()){
                        //   Get.find<AuthController>().clearSharedData();
                        //   Get.find<AuthController>().clear();
                        //   Get.find<AuthController>().clearCardHistory();
                        Get.offNamed(RouteHelper.getSignInPage());
                        },
                        // else{
                        //   print("you log out");
                        // }
                      // },
                      child: AccountWidget(
                          appIcon: AppIcon(
                            icon: Icons.logout,
                            backgroundColor: Colors.redAccent,
                            iconColor: Colors.white,
                            iconSize: 23,
                            size: 40,
                          ),
                          bigText: BigText(
                            text: "LogOut",
                          )),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),

        // ):
        //   CustomLoader()):
        //   Container(
        //     child: Center(child: Text("You Must login"),),);

      ),
    );
  }
}
