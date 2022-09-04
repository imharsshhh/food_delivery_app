import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_dbestech/base/custom_loader.dart';
import 'package:food_delivery_dbestech/forgetpass.dart';
import 'package:food_delivery_dbestech/pages/auth/sign_up_page.dart';
import 'package:food_delivery_dbestech/routes/route_helper.dart';
import 'package:food_delivery_dbestech/utils/colors.dart';
import 'package:food_delivery_dbestech/utils/dimensions.dart';
import 'package:food_delivery_dbestech/widgets/app_text_field.dart';
import 'package:food_delivery_dbestech/widgets/big_text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../base/show_custom_snack.dart';
import '../../base/signup_body_model.dart';
import '../../controllers/auth-controller.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    // var nameController = TextEditingController();
    // var phoneController = TextEditingController();
    void _login(AuthController authController)
    {
      // var authController = Get.find<AuthController>();

      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (email.isEmpty) {
        ShowCustomSnackBar("Type in your email address",
            title: 'Email ');
      } else if (!GetUtils.isEmail(email)) {
        ShowCustomSnackBar("Type in your Valid email address",
            title: 'Valid email address');
      } else if (password.isEmpty) {
        ShowCustomSnackBar("Type in your password", title: 'Password');
      } else if (password.length < 6) {
        ShowCustomSnackBar("Password can not be less than six character",
            title: 'Password');
      } else {

        authController.login(email, password).then((status) {
          // if (status.isSuccess) {
              Get.toNamed(RouteHelper.getInitial());
            // Get.toNamed(RouteHelper.getCartPage());
            //   // print("Success registration");
            // } else {
            //   ShowCustomSnackBar(status.message);
            // }
          // }
        });
      }
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<AuthController>(builder: (authController) {
          return !authController.isLoading
              ? SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      //============app logo===============
                      GestureDetector(
                        onTap: () {
                          _login(authController);
                        },
                        child: Container(
                          child: Center(
                            child: CircleAvatar(
                              radius: 80,
                              backgroundColor: Colors.white,
                              backgroundImage:
                                  AssetImage("assets/image/logo part 1.png"),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      //=======welcome============
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        width: double.maxFinite,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hello",
                              style: TextStyle(
                                  fontSize: 50, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Sign into your account",
                              style: TextStyle(
                                  fontSize: 20, color: Colors.grey[500]),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      //=============your email============
                      AppTextField(
                          textController: emailController,
                          hintText: "Email",
                          icon: Icons.email),
                      SizedBox(
                        height: 20,
                      ),
                      //============Your password==========
                      AppTextField(
                        textController: passwordController,
                        hintText: "Password",
                        icon: Icons.password_sharp,
                        isObscure: true,
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      SizedBox(
                        height: 5,
                      ),

                      //==================tag line=========

                      Row(
                        children: [
                          Expanded(child: Container()),
                          TextButton(
                              onPressed: (){
                                Navigator.push(context,MaterialPageRoute(builder:(
                                    context) => Forgetpass()));
                              },
                              child: Text("Forget Password",style: TextStyle(color: Colors.grey[500],fontSize: 20),)),
                          SizedBox(
                            width: 20,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 60,
                      ),

                      GestureDetector(
                        onTap: (){
                          _login(authController);
                          // Get.toNamed(RouteHelper.getInitial());
                        },
                        child: Container(
                          width: 160,
                          height: 60,
                          decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 5,
                                    spreadRadius: 1,
                                    offset: Offset(3, 2)
                                ),
                              ],
                              borderRadius: BorderRadius.circular(30),
                              color: AppColors.mainColor),

                          // child: GestureDetector(
                            // onTap: () {
                            //   Get.toNamed(RouteHelper.getInitial());
                            // },
                            child: Center(
                              child: BigText(
                                text: "Sign in",
                                size: 25,
                                color: Colors.white,
                              ),
                            ),
                          // ),
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),

                      //===============sign up options===============
                      RichText(
                        text: TextSpan(
                            text: "Don\'t have an account?",
                            style: TextStyle(
                                color: Colors.grey[500], fontSize: 20),
                            children: [
                              TextSpan(
                                  recognizer: TapGestureRecognizer()..onTap = () => Get.to(() => SignUpPage(),
                                        transition:
                                            Transition.leftToRightWithFade),
                                  text: "Create",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.mainBlackColor,
                                      fontSize: 20))
                            ]
                        ),
                      )
                    ],
                  ),
                )
              : CustomLoader();
        }
        )
    );
  }
}
