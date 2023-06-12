
import 'package:ecommerceprojct/ui/state_managers/user_auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/styles.dart';
import '../widget/common_elevated_button.dart';
import '../widget/common_text_field.dart';
import 'otp_verification_screen.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({Key? key}) : super(key: key);

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {

 final  TextEditingController _emailETController = TextEditingController();
 final GlobalKey<FormState> _formkey = GlobalKey<FormState>();


 // final List<Widget> themeMode = <Widget>[
 //    const Text('Light'),
 //    const Text('Dark'),
 //  ];
 //
 //  final List<bool> _selectedMode = <bool>[true, false,];
 //  bool vertical = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   ThemeBuilder.of(context)?.changeTheme();
      //   setState(() {
      //
      //   });
      // },
      //
      // ),
      body: GetBuilder<UserAuthController>(
        builder: (authController) {
          return Padding(
            padding: const EdgeInsets.all(32.0),
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    width: 80,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text("Welcome Back",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700),),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Please Enter Your Email Address",
                    style: subtitleTextStyle,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CommonTextField(
                      hintText: "example@gmail.com",
                      textInputType: TextInputType.emailAddress,
                      controller:_emailETController ,
                      validator: (String? value) {
                      if(value ?.isEmpty ?? true) {
                        return 'Enter a valied email';
                      }
                      return null;
                      }),
                  const SizedBox(
                    height: 12,
                  ),
                  authController.emailVerificationInProgress
                    ? const CircularProgressIndicator()
                    : CommonElevatedButton(title: "Next",
                      onTap: () async {
                      if(_formkey.currentState!.validate()){
                      final bool response = await authController.emailVerification(_emailETController.text);
                      if(response){
                              Get.to(
                                OTPVerificationScreen(
                                   email: _emailETController.text,
                                ),
                              );
                            } else {
                            if (mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Email verification failed ! try again'),
                                ),
                              );
                            }
                          }
                        }}),
                const SizedBox(height: 24,),

                  // ToggleButtons(
                  //   //direction: vertical ? Axis.vertical : Axis.horizontal,
                  //   onPressed: (int index) {
                  //
                  //
                  //
                  //     ThemeBuilder.of(context)?.changeTheme();
                  //
                  //     setState(() {
                  //
                  //       // The button that is tapped is set to true, and the others to false.
                  //       for (int i = 0; i < _selectedMode.length; i++) {
                  //         ThemeBuilder.of(context)?.changeTheme();
                  //
                  //         _selectedMode[i] = i == index;
                  //
                  //        print(index);
                  //         print(_selectedMode);
                  //       }
                  //     });
                  //   },
                  //   borderRadius: const BorderRadius.all(Radius.circular(8)),
                  //   // selectedBorderColor: ,
                  //   selectedColor: Colors.white,
                  //   fillColor: primaryColor,
                  //   color: primaryColor,
                  //   constraints: const BoxConstraints(
                  //     minHeight: 40.0,
                  //     minWidth: 80.0,
                  //   ),
                  //   isSelected: _selectedMode,
                  //   children: themeMode,
                  // ),

                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
