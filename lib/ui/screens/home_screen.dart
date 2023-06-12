import 'package:ecommerceprojct/ui/screens/email_verification_screen.dart';
import 'package:ecommerceprojct/ui/screens/profile_screen.dart';
import 'package:ecommerceprojct/ui/state_managers/auth_controller.dart';
import 'package:ecommerceprojct/ui/state_managers/catagory_controller.dart';
import 'package:ecommerceprojct/ui/state_managers/home_controller.dart';
import 'package:ecommerceprojct/ui/state_managers/product_by_remark_controller.dart';
import 'package:flutter/material.dart';
import '../state_managers/bottom_navigation_bar_controller.dart';
import '../widget/category_card_widget.dart';
import '../widget/home/app_bar_icon_button.dart';
import '../widget/home/home_carousel_widget.dart';
import '../widget/home/remarks_title_widget.dart';
import '../widget/home/search_text_field.dart';
import '../widget/product_card.dart';
import 'package:get/get.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: [
            Image.asset('assets/images/logo_nav.png'),
            const Spacer(),
            AppBarIconButton(
              iconData: Icons.person,
              onTap: () {
                Get.find<AuthController>().isLoggedIn().then((value) {
                  if(value){
                    Get.to(const ProfileScreen());
                  }else{
                    Get.to(const EmailVerificationScreen());
                  }
                });

              },
            ),
            AppBarIconButton(
              iconData: Icons.call,
              onTap: () {},
            ),
            AppBarIconButton(
              iconData: Icons.notifications_active_rounded,
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchTextField(),
              const SizedBox(
                height: 16,
              ),
              GetBuilder<HomeController>(
                builder: (homeController) {
                  if(homeController.getSliderInProgress){
                  return const SizedBox(
                    height: 180,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                  return HomeCarouselWidget(
                    homeSliderModel: homeController.homeSliderModel,
                  );
                }
              ),
              const SizedBox(
                height: 8,
              ),
              RemarksTitleWidget(
                remarksName: 'All Categories',
                onTapSeeAll: () {
                  Get.find<BottomNavigationBarController>().changeIndex(1);
                },
              ),
              const SizedBox(
                height: 8,
              ),
              GetBuilder<CategoryController>(
                builder: (categoryController) {
                  if(categoryController.getCategoryInProgress){
                    return const SizedBox(
                      height: 90,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: categoryController.categoryModel.categories!
                        .map(
                          (e) => CategoryCard(
                            name: e.categoryName.toString(),
                            imageUrl: e.categoryImg.toString(),
                            id: e.id ?? 0,
                          ),
                        )
                        .toList(),
                  ),
                );
                }
              ),
              const SizedBox(
                height: 16,
              ),

              RemarksTitleWidget(
                remarksName: 'Popular',
                onTapSeeAll: () {},
              ),
              const SizedBox(
                height: 8,
              ),
              GetBuilder<ProductByRemarkController>(
                  builder: (productByRemarkController) {
                    if(productByRemarkController.getPopularProductByRemarkInProgress){
                      return const SizedBox(
                        height: 90,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:
                        productByRemarkController.popularProductModel.products!
                            .map(
                              (product) => ProductCart(
                                product: product,
                              ),
                            )
                            .toList(),
                  ),
                );
              }
              ),
              const SizedBox(
                height: 16,
              ),
              RemarksTitleWidget(
                remarksName: 'Special',
                onTapSeeAll: () {},
              ),
              const SizedBox(
                height: 8,
              ),
              GetBuilder<ProductByRemarkController>(
                  builder: (productByRemarkController) {
                    if(productByRemarkController.getSpecialProductByRemarkInProgress){
                      return const SizedBox(
                        height: 90,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:
                        productByRemarkController.specialProductModel.products!
                            .map(
                              (product) => ProductCart(
                            product: product,
                          ),
                        )
                            .toList(),
                      ),
                    );
                  }
              ),

              const SizedBox(
                height: 16,
              ),
              RemarksTitleWidget(
                remarksName: 'New',
                onTapSeeAll: () {},
              ),
              const SizedBox(
                height: 8,
              ),
              GetBuilder<ProductByRemarkController>(
                  builder: (productByRemarkController) {
                    if(productByRemarkController.getNewProductByRemarkInProgress){
                      return const SizedBox(
                        height: 90,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:
                        productByRemarkController.newProductModel.products!
                            .map(
                              (product) => ProductCart(
                            product: product,
                          ),
                        )
                            .toList(),
                      ),
                    );
                  }
              ),

            ],
          ),
        ),
      ),
    );
  }
}


