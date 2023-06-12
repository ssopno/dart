import 'package:ecommerceprojct/data/models/profile_Model.dart';
import 'package:ecommerceprojct/ui/screens/complete_profile_screen.dart';
import 'package:ecommerceprojct/ui/state_managers/auth_controller.dart';
import 'package:get/get.dart';

import '../../data/services/network_caller.dart';

class UserProfileController extends GetxController{
  bool _getProfileDataInProgress = false;

  bool get getProfileDataInProgress => _getProfileDataInProgress;


  Future<bool>getProfileData() async{
    _getProfileDataInProgress = true;
    update();
    final response = await NetworkCaller.getReuqest(url:'/ReadProfile');
    _getProfileDataInProgress = false;
    if(response.isSuccess){
      final ProfileModel profileModel = ProfileModel.fromJson(response.returnData);
      if(profileModel.data !=null) {
        Get.find<AuthController>().saveProfileData(profileModel.data!.first);
      }else{
         Get.to(const CompleteProfileScreen());
      }
      update();
      return true;
    }else{
      update();
      return false;
    }
  }

}