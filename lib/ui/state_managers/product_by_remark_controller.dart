import 'package:ecommerceprojct/data/models/product_by_category_model.dart';
import 'package:ecommerceprojct/data/services/network_caller.dart';
import 'package:get/get.dart';

class ProductByRemarkController extends GetxController {
  bool _getPopularProductByRemarkInProgress = false;
  bool _getSpecialProductByRemarkInProgress = false;
  bool _getNewProductByRemarkInProgress = false;

  ProductByCategoryModel _popularProduct = ProductByCategoryModel();
  ProductByCategoryModel _specialProduct = ProductByCategoryModel();
  ProductByCategoryModel _newProduct = ProductByCategoryModel();

  bool get getPopularProductByRemarkInProgress => _getPopularProductByRemarkInProgress;
  bool get getSpecialProductByRemarkInProgress => _getSpecialProductByRemarkInProgress;
  bool get getNewProductByRemarkInProgress => _getNewProductByRemarkInProgress;


  ProductByCategoryModel get popularProductModel => _popularProduct;
  ProductByCategoryModel get specialProductModel => _specialProduct;
  ProductByCategoryModel get newProductModel => _newProduct;

  Future<bool> getPopularProductByRemark() async {
    _getPopularProductByRemarkInProgress = true;
    update();
    final response =
        await NetworkCaller.getReuqest(url: '/ListProductByRemark/popular');
    _getPopularProductByRemarkInProgress = false;
    if (response.isSuccess) {
      _popularProduct = ProductByCategoryModel.fromJson(response.returnData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
  Future<bool> getSpecialProductByRemark() async {
    _getSpecialProductByRemarkInProgress = true;
    update();
    final response =
        await NetworkCaller.getReuqest(url: '/ListProductByRemark/Special');
    _getSpecialProductByRemarkInProgress = false;
    if (response.isSuccess) {
      _specialProduct = ProductByCategoryModel.fromJson(response.returnData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
  Future<bool> getNewProductByRemark() async {
    _getNewProductByRemarkInProgress = true;
    update();
    final response =
        await NetworkCaller.getReuqest(url: '/ListProductByRemark/New');
    _getNewProductByRemarkInProgress = false;
    if (response.isSuccess) {
      _newProduct = ProductByCategoryModel.fromJson(response.returnData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}
