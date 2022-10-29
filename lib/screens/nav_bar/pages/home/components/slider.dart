import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SliderComponent extends StatelessWidget {
  const SliderComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        options: CarouselOptions(
          height: 120,
          initialPage: 0,
          viewportFraction: 1.0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(seconds: 1),
          scrollDirection: Axis.horizontal,
        ),
        items: const []
        //model.data!.banners
        //     .map((e) => Image(
        //   image: NetworkImage('${e.image}'),
        //   width: double.infinity,
        //   fit: BoxFit.cover,
        // ))
        //     .toList()
        );
  }
}
