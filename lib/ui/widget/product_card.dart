import 'package:ecommerceprojct/data/models/product.dart';
import 'package:ecommerceprojct/ui/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../state_managers/product_controller.dart';
import '../utils/app_color.dart';

class ProductCart extends StatelessWidget {
  const ProductCart({
    Key? key, required this.product,
  }) : super(key: key);

  final Product product;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: InkWell(
        onTap: (){
          Get.find<ProductController>().getProductDetails(product.id!);

          Get.to( ProductDetailsScreen(productId: product.id!,),);
        },
        borderRadius:BorderRadius.circular(10) ,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          shadowColor: primaryColor.withOpacity(0.3),
          elevation: 3,
          child: Column(
            children: [
              Image.network(
                product.image ?? '',
                width: 132,
                height: 90,
                fit: BoxFit.scaleDown,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      product.title ??'Unknown',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: greyColor.withOpacity(0.9),
                          letterSpacing: 0.3,
                          height: 1.2),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                         Text(
                          '\$${product.price}',
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: primaryColor),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children:  [
                           const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 14,
                            ),
                            Text(
                              '${product.star ?? 0 }',
                              style:const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: primaryColor),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(5)),
                          child: const Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Icon(
                              Icons.favorite_border_sharp,
                              size: 12,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}