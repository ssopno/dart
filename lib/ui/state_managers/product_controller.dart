
import 'package:get/get.dart';

import '../../data/models/product_by_category_model.dart';
import '../../data/models/product_details_model.dart';
import '../../data/services/network_caller.dart';


class ProductController extends GetxController {
  bool _getProductByCategoryInProgress = false;
  bool   _getProductDetailsInProgress = false;

  ProductByCategoryModel _productByCategoryModel = ProductByCategoryModel();
  ProductDetailsModel _productDetailsModel = ProductDetailsModel();

  bool get getProductByCategoryInProgress => _getProductByCategoryInProgress;
  bool get getProductDetailsInProgress => _getProductDetailsInProgress;

  ProductByCategoryModel get productByCategoryModel =>_productByCategoryModel;
  ProductDetailsModel get productDetailsModel =>_productDetailsModel;


  Future<bool> getProductByCategory(int categoryId) async {
    _getProductByCategoryInProgress = true;
    update();


    final response = await NetworkCaller.getReuqest(
        url: '/ListProductByCategory/$categoryId');
    _getProductByCategoryInProgress = false;
    if (response.isSuccess) {
      _productByCategoryModel =
          ProductByCategoryModel.fromJson(response.returnData);

      update();
      return true;
    } else {
      update();
      return false;
    }
  }



  Future<bool> getProductDetails(int productId) async {
    _getProductDetailsInProgress = true;
    update();

    final response = await NetworkCaller.getReuqest(
        url: '/ProductDetailsById/$productId');
    _getProductDetailsInProgress = false;
    if (response.isSuccess) {
     _productDetailsModel =
         ProductDetailsModel.fromJson(response.returnData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }

}
