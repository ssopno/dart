import 'package:ecommerceprojct/ui/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../state_managers/bottom_navigation_bar_controller.dart';
import '../widget/product_card.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Wish List'),
        leading: IconButton(
          onPressed: (){
            Get.find<BottomNavigationBarController>().backToHome();
          },
          icon:const Icon(Icons.arrow_back,color: greyColor,),
        ),
      ),
      // body: GridView.builder(
      //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //         crossAxisCount: 3, childAspectRatio: 0.71),
      //     itemCount: 50,
      //     itemBuilder: (context, index) {
      //       return const ProductCart();
      //     }),
    );
  }
}
