import 'package:ecommerceprojct/ui/state_managers/cart_controller.dart';
import 'package:ecommerceprojct/ui/state_managers/catagory_controller.dart';
import 'package:ecommerceprojct/ui/state_managers/home_controller.dart';
import 'package:ecommerceprojct/ui/state_managers/product_by_remark_controller.dart';
import 'package:ecommerceprojct/ui/state_managers/product_controller.dart';
import 'package:ecommerceprojct/ui/state_managers/user_auth_controller.dart';
import 'package:ecommerceprojct/ui/state_managers/user_profile_controller.dart';
import 'package:ecommerceprojct/ui/state_managers/wish_list_controller.dart';
import 'package:get/get.dart';

import 'ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';

import 'ui/state_managers/auth_controller.dart';
import 'ui/state_managers/bottom_navigation_bar_controller.dart';
import 'ui/utils/app_color.dart';
import 'ui/utils/theme_buider.dart';

void main() {
  runApp(const CraftyBay());
}

class CraftyBay extends StatelessWidget {
  const CraftyBay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      defaultBrightness: Brightness.light,
      builder: ( context, brightness) {
        return GetMaterialApp(
          initialBinding: GetXBinding(),
          //themeMode: ThemeMode.light,

          darkTheme: ThemeData(
            brightness: brightness,
            primaryColorDark: Colors.white,
            primaryColor: Colors.white,

            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  backgroundColor: blueBlack,
                )),
            // colorScheme: ThemeData().colorScheme.copyWith(secondary: Colors.white, primary: draculaBlack),
          ),

          theme: ThemeData(
            appBarTheme: const AppBarTheme(
                elevation: 1,
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600
                ),
                color: Colors.white),
            brightness: brightness,
            textTheme: const TextTheme(
              displayLarge: TextStyle(color: Colors.black),
              displayMedium: TextStyle(color: Colors.black),
              displaySmall: TextStyle(color: Colors.black),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                )),
            //colorScheme: ThemeData().colorScheme.copyWith(secondary: primaryColor, primary: primaryColor),
          ),
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),
        );
      },
    );
  }
}

class GetXBinding extends Bindings{
  @override
  void dependencies() {
   Get.put(BottomNavigationBarController());
   Get.put(UserAuthController());
   Get.put(AuthController());
   Get.put(UserProfileController());
   Get.put(HomeController());
   Get.put(CategoryController());
   Get.put(ProductByRemarkController());
   Get.put(ProductController());
   Get.put(WishListController());
   Get.put(CartController());

  }

}