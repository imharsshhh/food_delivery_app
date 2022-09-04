// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_dbestech/base/custom_loader.dart';
import 'package:food_delivery_dbestech/base/signup_body_model.dart';
import 'package:food_delivery_dbestech/controllers/auth-controller.dart';
import 'package:food_delivery_dbestech/routes/route_helper.dart';
import 'package:food_delivery_dbestech/utils/colors.dart';
import 'package:food_delivery_dbestech/utils/dimensions.dart';
import 'package:food_delivery_dbestech/widgets/app_text_field.dart';
import 'package:food_delivery_dbestech/widgets/big_text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:food_delivery_dbestech/base/show_custom_snack.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var signUpImage = ["t.png", "f.png", "g.png"];

    void _registration(AuthController authController) {
      // var authController = Get.find<AuthController>();
      String name = nameController.text.trim();
      String phone = phoneController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (name.isEmpty) {
        ShowCustomSnackBar("Type in your name", title: 'Name');
      } else if (phone.isEmpty) {
        ShowCustomSnackBar("Type in your phone number", title: 'Phone number');
      } else if (email.isEmpty) {
        ShowCustomSnackBar("Type in your email address",
            title: 'Email address');
      } else if (!GetUtils.isEmail(email)) {
        ShowCustomSnackBar("Type in your Valid email address",
            title: 'Valid email address');
      } else if (password.isEmpty) {
        ShowCustomSnackBar("Type in your password", title: 'Password');
      } else if (password.length < 6) {
        ShowCustomSnackBar("Password can not be less than six character",
            title: 'Password');
      } else {
        ShowCustomSnackBar("All went well", title: 'Perfect');
        SignUpBody signUpBody = SignUpBody(
            password: password, email: email, phone: phone, name: name);
        authController.registration(signUpBody).then((status) {
          if (status.isSuccess) {
            print("Success registration");
            Get.offNamed(RouteHelper.getInitial());
          } else {
            ShowCustomSnackBar(status.message);
          }
        });
      }
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<AuthController>(builder: (_authController) {
          return !_authController.isLoading
              ? SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                //app logo
                Container(
                  // height:  ,

                  child: Center(
                    child: CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.white,
                      backgroundImage:
                      AssetImage("assets/image/logo part 1.png"),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                //=============Your Email=========
                AppTextField(
                    textController: emailController,
                    hintText: "Email",
                    icon: Icons.email),
                SizedBox(
                  height: 20,
                ),
                //==========Your password===========
                AppTextField(
                  textController: passwordController,
                  hintText: "Password",
                  icon: Icons.password_sharp,
                  isObscure: true,
                ),
                SizedBox(
                  height: 20,
                ),
                //==============your name==========
                AppTextField(
                    textController: nameController,
                    hintText: "Name",
                    icon: Icons.person),
                SizedBox(
                  height: 20,
                ),
                //==============Your Phone============
                AppTextField(
                    textController: phoneController,
                    hintText: "Phone",
                    icon: Icons.phone),
                SizedBox(
                  height: 40,
                ),
                //==============sign up==========
                GestureDetector(
                  onTap: () {

                    // FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text)
                    // .then((value) {
                    //   print("Create new account");
                      _registration(_authController);
                    // }).onError((error, stackTrace) {
                    //   print("Error ${error.toString()}");
                    // });

                  },
                  child: Container(
                    width: 160,
                    height: 60,
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: Offset(0.8, 2)
                          ),
                        ],
                        borderRadius: BorderRadius.circular(30),
                        color: AppColors.mainColor),
                    child: Center(
                      child: BigText(
                        text: "Sign up",
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                //==========tag line=================
                RichText(
                    text: TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.back(),
                        text: "Have an account already?",
                        style: TextStyle(
                            color: Colors.grey[500], fontSize: 20))),
                SizedBox(
                  height: 60,
                ),
                //sign up options
                RichText(
                    text: TextSpan(
                        text:
                        "Sign up using one of the following methods",
                        style: TextStyle(
                            color: Colors.grey[500], fontSize: 16))),
                Wrap(
                    children: List.generate(
                      3,
                          (index) => Padding(
                          padding: EdgeInsets.all(9),
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage(
                                "assets/image/" + signUpImage[index]),
                          )),
                    ))
              ],
            ),
          )
              : const CustomLoader();
        }));
  }
}
