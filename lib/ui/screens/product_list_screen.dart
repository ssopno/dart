import 'package:ecommerceprojct/ui/state_managers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



import '../utils/app_color.dart';
import '../widget/product_card.dart';

class ProductListScreen extends StatefulWidget {
  final int categoryId;

  const ProductListScreen({Key? key, required this.categoryId})
      : super(key: key);

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {

  @override
  void initState() {
    super.initState();
    Get.find<ProductController>().getProductByCategory(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        leading: const BackButton(color: greyColor),
      ),
      body: GetBuilder<ProductController>(
          builder: (productController) {
            if (productController.getProductByCategoryInProgress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, childAspectRatio: 0.71),
                itemCount: productController.productByCategoryModel.products
                    ?.length ?? 0,
                itemBuilder: (context, index) {
                  return ProductCart(
                    product: productController.productByCategoryModel
                        .products![index],
                  );
                });
          }
      ),
    );
  }
}
