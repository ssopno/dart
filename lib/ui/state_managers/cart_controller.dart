import 'package:ecommerceprojct/data/services/network_caller.dart';
import 'package:ecommerceprojct/ui/state_managers/auth_controller.dart';
import 'package:get/get.dart';

class CartController extends GetxController{
  bool _addToCartInProgress = false;
  bool _getCartListInProgress = false;

  bool get addToCartInProgress => _addToCartInProgress;
  bool get getCartListInProgress => _getCartListInProgress;


  Future<bool> addToCart(int productId, String size, String color)async{
    _addToCartInProgress = true;
    update();
    final response = await NetworkCaller.postReuqest(url: '/CreateCartList',body: {
      "product_id":productId,
      "color": color,
      "size":size
    });
    _addToCartInProgress = false;
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


  Future<bool> getCartList( )async{
    _getCartListInProgress = true;
    update();
    final response = await NetworkCaller.getReuqest(url: '/CartList');
    _getCartListInProgress = false;
    if(response.isSuccess){
      update();
      return true;
    }else{
      update();
      return false;
    }
  }

}