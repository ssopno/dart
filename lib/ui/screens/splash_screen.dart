import 'package:ecommerceprojct/ui/screens/bottom_nav_bar_screen.dart';
import 'package:ecommerceprojct/ui/screens/email_verification_screen.dart';
import 'package:ecommerceprojct/ui/state_managers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/app_color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1)).then((value) async {
      final bool loginState = await Get.find<AuthController>().isLoggedIn();
      if(loginState) {
        Get.off(const BottomNavBarScreen());
      }else{
        Get.off(const EmailVerificationScreen());
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Center(
            child: Image.asset(
              'assets/images/logo.png',
              width: 100,
            ),
          )),
          Column(
            children: const [
              CircularProgressIndicator(
                color: primaryColor,
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Version 1.0',
                  style: TextStyle(
                      fontSize: 12,
                      color: greyColor,
                      letterSpacing: 0.6),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
