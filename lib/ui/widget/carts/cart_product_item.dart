import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import '../product_stepper.dart';

class CartProductItem extends StatelessWidget {
  const CartProductItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin:const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      elevation: 0,
      child: Row(
        children: [
          Image.asset(
            'assets/images/dummy_shoe.png',
            width: 120,
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'new shoe of nike',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: greyColor),
                          ),
                          Row(
                            children: const [
                              Text(
                                'size:12',
                                style: TextStyle(color: greyColor),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                'color: red',
                                style: TextStyle(color: greyColor),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.delete,
                          color: softGreyColor,
                        ))
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:const [
                    Text('\$100',style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: primaryColor,
                        fontSize: 16
                    ),), ProductStepper(),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );

  }
}
