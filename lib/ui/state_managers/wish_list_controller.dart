import 'package:ecommerceprojct/data/services/network_caller.dart';
import 'package:ecommerceprojct/ui/state_managers/auth_controller.dart';
import 'package:get/get.dart';

class WishListController extends GetxController {
  bool _addNewItemInProgress = false;

  bool get addNewItemInProgress => _addNewItemInProgress;

  Future<bool> addWishList(int productId) async {
    _addNewItemInProgress = true;
    update();
    final response = await NetworkCaller.getReuqest(url: '/CreateWishList/$productId');
    _addNewItemInProgress =false;
    if(response.isSuccess){
      update();
      return true;
    }else{
      if(response.statusCode == 401){
        Get.find<AuthController>().logOut();
      }
      update();
      return false;
    }
  }
}
