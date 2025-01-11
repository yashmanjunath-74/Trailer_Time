import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:trailertime/models/top_rated.dart';
import 'package:trailertime/utils/utils.dart';

class Coustumcrosel extends StatelessWidget {
  const Coustumcrosel({super.key, required this.data});

  final TopRated data;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: (size.height * 0.33 < 300) ? 300 : size.height * 0.33,
      child: CarouselSlider.builder(
        itemCount: data.results.length,
        itemBuilder: (BuildContext context, int index, int realINdex) {
          var url = data.results[index].backdropPath.toString();
          return Container(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: GestureDetector(
                    child: CachedNetworkImage(imageUrl: "$imageurl$url"),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(data.results[index].title)
              ],
            ),
          );
        },
        options: CarouselOptions(
          aspectRatio: 16 / 9,
          viewportFraction: 0.9,
          enlargeCenterPage: true,
          enableInfiniteScroll: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          scrollDirection: Axis.horizontal,
          height: (size.height * 0.33 < 300) ? 300 : size.height * 0.33,
          // aspectRatio: 16 / 9,
          // viewportFraction: 0.9,
          initialPage: 0,
          // enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          // autoPlayInterval: const Duration(seconds: 3),
          // autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          // enlargeCenterPage: true,
          // scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
