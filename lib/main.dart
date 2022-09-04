// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_dbestech/controllers/cart_controller.dart';
import 'package:food_delivery_dbestech/controllers/popular_product_controller.dart';
import 'package:food_delivery_dbestech/helper/dependencies.dart' as dep;
import 'package:food_delivery_dbestech/pages/auth/sign_in_page.dart';
import 'package:food_delivery_dbestech/pages/auth/sign_up_page.dart';
import 'package:food_delivery_dbestech/pages/cart/cart_page.dart';
import 'package:food_delivery_dbestech/pages/food/recommended_food_detail.dart';
import 'package:food_delivery_dbestech/pages/home/main_food_page.dart';
import 'package:food_delivery_dbestech/pages/splash/splash_page.dart';
import 'package:food_delivery_dbestech/routes/route_helper.dart';
import 'package:get/get.dart';

import 'controllers/recommended_product_controller.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCardData();
    return GetBuilder<PopularProductController>(builder: (_) {
      return GetBuilder<RecommendedProductController>(builder: (_) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          // home:SignInPage(),
          initialRoute: RouteHelper.getSplash(),
          getPages: RouteHelper.routes,
        );
      });
    });
  }
}
