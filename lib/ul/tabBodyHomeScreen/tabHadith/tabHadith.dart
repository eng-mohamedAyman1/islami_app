import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/ul/tabBodyHomeScreen/tabHadith/hadith_item.dart';
import 'package:islami_app/util/context_extension.dart';

class Tabhadith extends StatelessWidget {
  const Tabhadith({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(height: context.height,enlargeCenterPage: true),
      items: List.generate(50, (index) => index+1,).map((i) {
        return  HadithItem(index: i);
      }).toList(),
    );
  }
}
