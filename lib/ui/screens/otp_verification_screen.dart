import 'dart:async';
import 'package:ecommerceprojct/ui/screens/home_screen.dart';
import 'package:ecommerceprojct/ui/state_managers/user_auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../utils/app_color.dart';
import 'package:get/get.dart';
import '../utils/styles.dart';
class OTPVerificationScreen extends StatefulWidget {
   final String email;
  const OTPVerificationScreen({Key? key, required this.email}) : super(key: key);

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final TextEditingController _otpETController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late Timer _timer;
  int _start = 5;
  bool otpVerificationInProgress = false;

  void startTimer() {
    const oneSec = Duration(seconds: 3);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer)
      {        if (_start == 0) {
        setState(() {
          timer.cancel();
          otpVerificationInProgress = false;

        });
      } else {
        setState(() {
          _start--;
        });
      }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }




  @override
  void dispose() {
    super.dispose();
    _timer.cancel();

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<UserAuthController>(
        builder: (userAuthController) {
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child:  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      height: 80,
                      width: 80,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      'Enter OTP Code',
                      style: titleTextStyle,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      'A 4 digit OTP code has been sent',
                      style: subtitleTextStyle,
                    ),
                    const SizedBox(
                      height: 24,
                    ),

                    Form(
                      key: formKey,
                      child: PinCodeTextField(
                        validator: (String? value) {
                        if (value?.isEmpty ?? true) {
                          return 'Enter pin code';
                        }
                        return null;
                      },
                        length: 4,
                        keyboardType: TextInputType.number,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        obscureText: false,
                        controller: _otpETController,
                        animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(8),
                          fieldHeight: 45,
                          fieldWidth: 45,
                          activeFillColor: Colors.white,
                          selectedFillColor: Colors.white,
                          selectedColor: Colors.green,
                          activeColor: primaryColor,
                          inactiveFillColor: Colors.white,
                          inactiveColor: primaryColor
                        ),
                        animationDuration: const Duration(milliseconds: 300),
                        enableActiveFill: true,
                        onCompleted: (v) {

                        },
                        onChanged: (value) {

                        },
                        appContext: context,
                      ),
                    ),

                    const SizedBox(
                      height: 16,
                    ),

                  userAuthController.otpVerificationInProgress
                      ? const CircularProgressIndicator()
                      : SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                           if(formKey.currentState!.validate() ){

                              final bool response =
                                  await userAuthController.otpVerification(
                                      widget.email, _otpETController.text);
                            if (response) {
                                Get.offAll(const HomeScreen());
                              } else {
                                Get.showSnackbar(const GetSnackBar(
                                  title: 'Otp verification failed ! try again',
                                  message: 'check your once again before enter it',
                                  duration: Duration(seconds: 3),
                                ),);
                              }
                            }},
                            child: const Text('Next'),
                          ),
                        ),
                  const SizedBox(
                      height: 24,
                    ),



                    _start != 0
                        ? Padding(
                          padding: const EdgeInsets.only(left: 55.0),
                          child: Row(
                      children: [
                          Text(
                            "This code will be expire in",
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            _start.toString(),
                            style: const TextStyle(
                              color: primaryColor,
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                      ],
                    ),
                        )
                      : Center(
                          child: Text(
                            "Don't receive code?",
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                    const SizedBox(height: 8,),


                    TextButton(
                    onPressed: () {
                      setState(() {
                        _start = 5;
                        startTimer();
                      });
                    },
                    child: const Text(
                      'Resend Code',
                      style:
                          TextStyle(
                              color:  greyColor,
                              fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
                ),);
        }
      ),
    );
  }
}

