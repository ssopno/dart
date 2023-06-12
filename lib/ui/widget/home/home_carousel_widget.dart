import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerceprojct/data/models/home_slider_model.dart';
import 'package:flutter/material.dart';

import '../../utils/app_color.dart';

class HomeCarouselWidget extends StatelessWidget {
  final HomeSliderModel homeSliderModel;
  final ValueNotifier<int> _currentCarouselIndex = ValueNotifier(0);

  HomeCarouselWidget({super.key, required this.homeSliderModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 180.0,
              viewportFraction: 1,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 6),
              onPageChanged: (index, _) {
                _currentCarouselIndex.value = index;
              }),
          items: homeSliderModel.sliders!.map((sliders) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 2.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                          image: NetworkImage(sliders.image ?? '')),
                      color: primaryColor),
                  alignment: Alignment.center,
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(
          height: 8,
        ),
        ValueListenableBuilder(
            valueListenable: _currentCarouselIndex,
            builder: (context, currentValue, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0;
                      i < (homeSliderModel.sliders?.length ?? 0);
                      i++)
                    Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          height: 12,
                          width: 12,
                          decoration: BoxDecoration(
                              color: currentValue == i ? primaryColor : null,
                              border:
                                  Border.all(color: greyColor.withOpacity(0.5)),
                              borderRadius: BorderRadius.circular(10)),
                        )),
                ],
              );
            }),
      ],
    );
  }
}
