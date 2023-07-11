import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/house.dart';
import 'package:flutter_application_1/pages/details/components/bottom_buttons.dart';
import 'package:flutter_application_1/pages/details/components/carousel_images.dart';
import 'package:flutter_application_1/pages/details/components/custom_app_bar.dart';
import 'package:flutter_application_1/pages/details/components/house_details.dart';

class DetailsScreen extends StatefulWidget {
  final house;

  const DetailsScreen({Key? key, required this.house}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              Stack(
                children: [
                  //CarouselImages(widget.house.moreImagesUrl),
                  CarouselImages([
                    'images/house1.jpeg',
                    'images/indoor1.jpg',
                    'images/indoor2.jpg',
                    'images/indoor3.jpg',
                    'images/indoor4.jpg',
                    'images/indoor5.jpg',
                  ]),
                  CustomAppBar(),
                ],
              ),
              HouseDetails(widget.house),
            ],
          ),
          BottomButtons(),
        ],
      ),
    );
  }
}
