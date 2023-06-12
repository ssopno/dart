
import 'package:ecommerceprojct/ui/screens/cart_screen.dart';
import 'package:ecommerceprojct/ui/screens/category_screen.dart';
import 'package:ecommerceprojct/ui/screens/home_screen.dart';
import 'package:ecommerceprojct/ui/screens/wish_list_screen.dart';
import 'package:ecommerceprojct/ui/state_managers/home_controller.dart';
import 'package:ecommerceprojct/ui/state_managers/product_by_remark_controller.dart';
import 'package:ecommerceprojct/ui/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../state_managers/bottom_navigation_bar_controller.dart';
import '../state_managers/catagory_controller.dart';



class BottomNavBarScreen extends StatefulWidget {
 const  BottomNavBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
 final List<Widget> _screens = const [
  HomeScreen(),
  CategoryScreen(),
  CartScreen(),
  WishListScreen()
];

 @override
  void initState() {
    super.initState();
    Get.find<HomeController>().getHomeSlider();
    Get.find<CategoryController>().getCategories();
    Get.find<ProductByRemarkController>().getPopularProductByRemark();
    Get.find<ProductByRemarkController>().getSpecialProductByRemark();
    Get.find<ProductByRemarkController>().getNewProductByRemark();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<BottomNavigationBarController>(
        builder: (controller) {
          return _screens[
           controller.selectedIndex
          ];
        }
      ),
      bottomNavigationBar: GetBuilder<BottomNavigationBarController>(
        builder: (controller) {
          return BottomNavigationBar(
            onTap: (value){
              controller.changeIndex(value);
            },
            currentIndex: controller.selectedIndex,
            selectedItemColor: primaryColor,
            unselectedItemColor: softGreyColor,
            showUnselectedLabels:true ,
            elevation: 10,
            iconSize: 30,


            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label:' home'),
              BottomNavigationBarItem(icon: Icon(Icons.grid_view),label: 'Categories'),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined),label: 'Cart'),
              BottomNavigationBarItem(icon: Icon(Icons.favorite_outline),label: 'Wishlist'),
            ],

          );
        }
      ),
    );
  }
}

