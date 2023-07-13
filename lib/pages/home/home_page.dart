import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/color.dart';
import 'package:flutter_application_1/utils/data.dart';
import 'package:flutter_application_1/widgets/category_item.dart';
import 'package:flutter_application_1/widgets/custom_image.dart';
import 'package:flutter_application_1/widgets/custom_textbox.dart';
import 'package:flutter_application_1/widgets/icon_box.dart';
import 'package:flutter_application_1/widgets/property_item.dart';
import 'package:flutter_application_1/widgets/recent_item.dart';

import '../../widgets/bottombar_item.dart';
import '../category/studio.dart';
import '../search.dart';
import '../visitor/explore.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _activeTab = 0;
  final List _barItems = [
    {
      "icon": Icons.home_outlined,
      "active_icon": Icons.home_rounded,
      "page": HomePage(),
    },
    {
      "icon": Icons.search_outlined,
      "active_icon": Icons.search,
      "page": Search(),
    },
    {
      "icon": Icons.favorite_border,
      "active_icon": Icons.favorite_outlined,
      "page": HomePage(),
    },
    {
      "icon": Icons.forum_outlined,
      "active_icon": Icons.forum_rounded,
      "page": HomePage(),
    },
    {
      "icon": Icons.settings_outlined,
      "active_icon": Icons.settings_rounded,
      "page": HomePage(),
    },
  ];
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: AppColor.appBgColor,
          pinned: true,
          snap: true,
          floating: true,
          title: _buildHeader(),
        ),
        SliverToBoxAdapter(child: _buildBody())
      ],
    );
  }

  _buildHeader() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Bienvenue sur Estate App",
                  style: TextStyle(
                    color: AppColor.darker,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "PattyKev",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            CustomImage(
              "https://avatars.githubusercontent.com/u/101264420?v=4",
              width: 35,
              height: 35,
              trBackground: true,
              borderColor: AppColor.primary,
              radius: 10,
            ),
          ],
        ),
      ],
    );
  }

  _buildBody() {
    return Material(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            _buildSearch(),
            const SizedBox(
              height: 20,
            ),
            _buildCategories(),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Populaire",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Voir tout",
                    style: TextStyle(fontSize: 14, color: AppColor.darker),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            _buildPopulars(),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Récent",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Voir tout",
                    style: TextStyle(fontSize: 14, color: AppColor.darker),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            _buildRecent(),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }

  int _selectedCategory = 0;
  Widget _buildCategories() {
    List<Widget> lists = List.generate(
      categories.length,
      (index) => CategoryItem(
        data: categories[index],
        selected: index == _selectedCategory,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => Studio(),
            ),
          );
        },
      ),
    );
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(bottom: 5, left: 15),
      child: Row(children: lists),
    );
  }

  Widget _buildPopulars() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 240,
        enlargeCenterPage: true,
        disableCenter: true,
        viewportFraction: .8,
      ),
      items: List.generate(
        populars.length,
        (index) => PropertyItem(
          data: populars[index],
          owner: false,
        ),
      ),
    );
  }

  Widget _buildRecent() {
    List<Widget> lists = List.generate(
      recents.length,
      (index) => RecentItem(
        data: recents[index],
      ),
    );

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(bottom: 5, left: 15),
      child: Row(children: lists),
    );
  }

  Widget _buildSearch() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Expanded(
            child: CustomTextBox(
              hint: "Rechercher",
              prefix: Icon(Icons.search, color: Colors.grey),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          IconBox(
            child: Icon(Icons.filter_list_rounded, color: Colors.white),
            bgColor: AppColor.secondary,
            radius: 10,
          )
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
    return Material(
        child: Container(
      height: 55,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: AppColor.bottomBarColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColor.shadowColor.withOpacity(0.1),
            blurRadius: 1,
            spreadRadius: 1,
            offset: Offset(0, 1),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: List.generate(
          _barItems.length,
          (index) => BottomBarItem(
            _activeTab == index
                ? _barItems[index]["active_icon"]
                : _barItems[index]["icon"],
            isActive: _activeTab == index,
            activeColor: AppColor.primary,
            onTap: () {
              setState(() {
                _activeTab = index;
              });
            },
          ),
        ),
      ),
    ));
  }
}
