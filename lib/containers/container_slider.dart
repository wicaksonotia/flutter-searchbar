import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:searchbar/models/carousel_model.dart';

class CarouselContainer extends StatelessWidget {
  const CarouselContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imageList = [
      'assets/images/slider1.jpg',
      'assets/images/slider2.jpg',
      'assets/images/slider3.jpg',
      'assets/images/slider4.jpg',
    ];

    return Container(
      margin: EdgeInsets.only(top: 5),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 200,
          autoPlay: true,
          enlargeCenterPage: true,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          viewportFraction: 0.8,
        ),
        items: imageList.map((imageUrl) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage(imageUrl),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
