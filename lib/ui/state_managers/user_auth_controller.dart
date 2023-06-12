import 'package:ecommerceprojct/data/services/network_caller.dart';
import 'package:ecommerceprojct/ui/state_managers/auth_controller.dart';
import 'package:ecommerceprojct/ui/state_managers/user_profile_controller.dart';
import 'package:get/get.dart';

class UserAuthController extends GetxController{
  bool _emailVerificationInProgress = false;
  bool _otpVerificationInProgress = false;

  bool get emailVerificationInProgress => _emailVerificationInProgress;
  bool get otpVerificationInProgress => _otpVerificationInProgress;


 Future<bool>emailVerification(String email) async{
  _emailVerificationInProgress = true;
  update();
  final response = await NetworkCaller.getReuqest(url:'/UserLogin/$email');
  _emailVerificationInProgress = false;
  if(response.isSuccess){
 update();
 return true;
  }else{
    update();
    return false;
  }
 }

  Future<bool> otpVerification(String email, String otp) async {
    _otpVerificationInProgress = true;
    update();
    final response =
        await NetworkCaller.getReuqest(url: '/VerifyLogin/$email/$otp');
    _otpVerificationInProgress = false;
    if (response.isSuccess) {
      await Get.find<AuthController>().saveToken(response.returnData['data']);
      Get.find<UserProfileController>().getProfileData();
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}