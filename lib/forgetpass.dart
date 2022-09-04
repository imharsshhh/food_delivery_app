import 'package:food_delivery_dbestech/pages/auth/sign_in_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_delivery_dbestech/routes/route_helper.dart';
import 'package:food_delivery_dbestech/utils/colors.dart';
import 'package:food_delivery_dbestech/widgets/app_icon.dart';
import 'package:food_delivery_dbestech/widgets/app_text_field.dart';
import 'package:food_delivery_dbestech/widgets/big_text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';

import 'base/show_custom_snack.dart';
import 'controllers/auth-controller.dart';

class Forgetpass extends StatefulWidget {
  const Forgetpass({Key? key}) : super(key: key);

  @override
  State<Forgetpass> createState() => _ForgetpassState();
}

class _ForgetpassState extends State<Forgetpass> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // @override
  // Widget build(BuildContext context) {
  //   var emailController = TextEditingController();
  //   var passwordController = TextEditingController();
  //   // var nameController = TextEditingController();
  //   // var phoneController = TextEditingController();
  //   void _login(AuthController authController)
  //   {
  //     // var authController = Get.find<AuthController>();
  //
  //     String email = emailController.text.trim();
  //     String password = passwordController.text.trim();
  //
  //     if (email.isEmpty) {
  //       ShowCustomSnackBar("Type in your email address",
  //           title: 'Email ');
  //     } else if (!GetUtils.isEmail(email)) {
  //       ShowCustomSnackBar("Type in your Valid email address",
  //           title: 'Valid email address');
  //     } else if (password.isEmpty) {
  //       ShowCustomSnackBar("Type in your password", title: 'Password');
  //     } else if (password.length < 6) {
  //       ShowCustomSnackBar("Password can not be less than six character",
  //           title: 'Password');
  //     } else {
  //
  //       authController.login(email, password).then((status) {
  //         if (status.isSuccess) {
  //           Get.toNamed(RouteHelper.getInitial());
  //           // Get.toNamed(RouteHelper.getCartPage());
  //           print("Success registration");
  //           // } else {
  //           ShowCustomSnackBar(status.message);
  //           // }
  //           // }
  //         }
  //       });
  //     }
  //   }




    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Container(

            child: Stack(

              children: [
                //  Positioned(
                //      top: 0 ,
                //       child: Image.asset("images/c1.png")),

                SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(

                        color: AppColors.mainColor,
                        width: double.maxFinite,
                        padding: const EdgeInsets.only(
                            top: 45, bottom: 10, left: 9),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(

                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => SignInPage()));
                              },
                              icon: AppIcon(icon: Icons.arrow_back_ios,),
                            ),
                            SizedBox(width: 45,),

                            Center(
                                child: Padding(
                                    padding: EdgeInsets.only(
                                        bottom: 10, left: 4, right: 0),
                                    child: Text(
                                      'Forget Password',
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white,),
                                    ))),
                          ],
                        ),
                      ),


                      SizedBox(
                        height: 140,
                      ),
                      AppTextField(

                          textController: emailController,
                          hintText: "Email",
                          icon: Icons.email),
                      SizedBox(
                        height: 30,
                      ),
                      AppTextField(
                          isObscure: true,
                          textController: passwordController,
                          hintText: "Password",
                          icon: Icons.password),
                      SizedBox(
                        height: 30,
                      ),
                      AppTextField(
                        isObscure: true,
                        // textController: conformController,
                        hintText: "Conform Password",
                        icon: Icons.password_outlined,
                        textController: passwordController,),
                      Container(
                          margin: EdgeInsets.only(
                              top: 40, left: 100, right: 100),
                          height: 60,
                          width: 190,

                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: RaisedButton(

                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),

                            ),
                            elevation: 7,
                            color: AppColors.mainColor,
                            // onPressed: () {
                            //
                            //has
                            // },
                            child: Text('Set Password', style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20)),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => SignInPage())
                              );
                            },
                          )
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 59, right: 10),
                        child: Text(
                          "Don't Have Idea How to do This !!", style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 20,
                            fontWeight: FontWeight.bold),),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, right: 10),
                        child: Text("Do you Want Tips?", style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),),
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(top: 0, right: 30),
                          child: TextButton(

                            onPressed: () {
                              //forgot password screen
                            },
                            child: TextButton(
                              onPressed: () =>
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(

                                          title: const Text('Follow Steps',
                                            style: TextStyle(fontSize: 30,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.greenAccent),),
                                          content: Container(
                                            height: 200,
                                            width: 300,
                                            child: Column(
                                              children: [
                                                Text("1.Enter EmailId",
                                                  style: TextStyle(fontSize: 20,
                                                      color: Colors
                                                          .grey[700]),),
                                                Text(
                                                  "Email Associate with Account",
                                                  style: TextStyle(fontSize: 15,
                                                      color: Colors.blueGrey),),
                                                SizedBox(
                                                  height: 12,
                                                ),
                                                Text("2.Set Password",
                                                  style: TextStyle(fontSize: 20,
                                                      color: Colors
                                                          .grey[700]),),
                                                Text(
                                                  "Make Password moare Then 6 digits",
                                                  style: TextStyle(fontSize: 15,
                                                      color: Colors.blueGrey),),
                                                SizedBox(
                                                  height: 12,
                                                ),
                                                Text("3.Conforme Password",
                                                  style: TextStyle(fontSize: 20,
                                                      color: Colors
                                                          .grey[700]),),
                                                Text(
                                                  "Write Same as you set Before",
                                                  style: TextStyle(fontSize: 15,
                                                      color: Colors.blueGrey),),
                                              ],
                                            ),
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context, 'OK'),
                                              child: const Text('Got It',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.greenAccent,
                                                    fontSize: 20),
                                              ),)
                                          ],
                                        ),
                                  ),
                              child: Center(child: const Text('Click Here',
                                  style: TextStyle(fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.greenAccent,))),
                            ),
                          ),
                        ),
                      ),

                    ],

                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }



