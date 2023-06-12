// import 'dart:async';
//
// import 'package:get/get.dart';
//
// class OtpTimerController extends GetxController{
//   late Timer _timer;
//   int _start = 5;
//   bool otpVerificationInProgress = false;
//
//   void startTimer() {
//     const oneSec = Duration(seconds: 2);
//     _timer = Timer.periodic(
//       oneSec,
//           (Timer timer)
//       {        if (_start == 0) {
//           timer.cancel();
//           otpVerificationInProgress = false;
//           update();
//
//
//       } else {
//
//           _start--;
//           update();
//
//       }
//       },
//     );
//   }
//
//
//
//   @override
//   void dispose() {
//     super.dispose();
//     _timer.cancel();
//
//   }

import 'dart:async';

import 'package:get/get.dart';

class OtpTimerController extends GetxController{
  late Timer _timer;
  int start = 10;
  bool? isTimerEnd;

  //int get start => _start;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer =  Timer.periodic(
      oneSec,
          (Timer timer) {
        if (start == 0) {
          timer.cancel();
          isTimerEnd=true;
          update();

        } else {
          start--;
          update();

        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}