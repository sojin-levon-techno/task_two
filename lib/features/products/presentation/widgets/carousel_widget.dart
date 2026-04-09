/* 
assets\images\car_1.jpg
assets\images\car_2.jpg
assets\images\car_3.jpg
assets\images\car_4.jpg
assets\images\car_5.jpg
*/

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      'assets/images/car_1.jpg',
      'assets/images/car_2.jpg',
      'assets/images/car_3.jpg',
      'assets/images/car_4.jpg',
      'assets/images/car_5.jpg',
    ];
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        enlargeCenterPage: true,
        viewportFraction: 1.0,
      ),
      items: images.map((path) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(path, width: double.infinity, fit: BoxFit.cover),
          ),
        );
      }).toList(),
    );
  }
}
