import 'package:ecommerceprojct/ui/state_managers/bottom_navigation_bar_controller.dart';
import 'package:ecommerceprojct/ui/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/carts/cart_product_item.dart';
import '../widget/common_elevated_button.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: greyColor,
          ),
          onPressed: () {
            Get.find<BottomNavigationBarController>().backToHome();


          },
        ),
      ),
      body: Column(
        children: [
         Expanded(child: ListView.builder(
             itemCount: 10,
             itemBuilder: (context, index){
           return const CartProductItem();
         }),),

          Container(
            decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.15),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                )),
            child: Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Total Price',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: softGreyColor,
                        ),
                      ),
                      Text(
                        '\$300',
                        style:  TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: primaryColor),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 120,
                    child: CommonElevatedButton(
                              onTap: () async {

                              },
                        title: 'Checkout'
                    ),


                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

