// ignore: depend_on_referenced_packages
import 'package:carousel_pro/carousel_pro.dart';
//import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselImages extends StatefulWidget {
  final List<String> imagesListUrl;

  CarouselImages(this.imagesListUrl);

  @override
  _CarouselImagesState createState() => _CarouselImagesState();
}

class _CarouselImagesState extends State<CarouselImages> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.35,
      child: Carousel(
        dotSize: 5,
        dotBgColor: Colors.transparent,
        autoplay: false,
        images: [
          AssetImage(
            'images/house1.jpeg',
          ),
          AssetImage(
            'images/indoor2.jpg',
          ),
          AssetImage(
            'images/indoor3.jpg',
          ),
          AssetImage(
            'images/indoor4.jpg',
          ),
          AssetImage(
            'images/indoor5.jpg',
          ),
        ],
      ),
    );
  }
}
