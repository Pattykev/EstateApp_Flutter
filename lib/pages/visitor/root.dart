import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/visitor/explore.dart';
import 'package:flutter_application_1/utils/color.dart';
import 'package:flutter_application_1/widgets/bottombar_item.dart';

import 'package:flutter_application_1/pages/home/home_page.dart';

import '../search.dart';
import '../userParam/schedule_list.dart';
import '../userParam/user_param.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
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
      "icon": Icons.calendar_month_outlined,
      "active_icon": Icons.calendar_month_outlined,
      "page": ScheduleList(),
    },
    {
      "icon": Icons.settings_outlined,
      "active_icon": Icons.settings_rounded,
      "page": UserParam(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBgColor,
      body: _buildPage(),
      floatingActionButton: _buildBottomBar(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }

  Widget _buildPage() {
    return Material(
        child: IndexedStack(
      index: _activeTab,
      children: List.generate(
        _barItems.length,
        (index) => _barItems[index]["page"],
      ),
    ));
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
