import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/color.dart';

import '../model/house.dart';
import '../pages/category/studio.dart';
import '../pages/details/details_screen.dart';
import '../utils/data.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({
    Key? key,
    required this.data,
    this.selected = false,
    this.onTap,
  }) : super(key: key);

  final data;
  final bool selected;
  final GestureTapCallback? onTap;
  //House house = populars[0];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        padding: EdgeInsets.fromLTRB(5, 20, 5, 0),
        margin: EdgeInsets.only(right: 10),
        width: 90,
        height: 90,
        decoration: BoxDecoration(
          color: selected ? AppColor.primary : AppColor.cardColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: AppColor.shadowColor.withOpacity(0.1),
              spreadRadius: .5,
              blurRadius: .5,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(
              data["icon"],
              size: 25,
              color: selected ? Colors.white : Colors.black,
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: Text(
                data["name"],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 13,
                  color: selected ? Colors.white : AppColor.darker,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/*
onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailsScreen(
              house: house,
            ),
          ),
        );
      },
      */