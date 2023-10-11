import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:splizz/models/user.dart';
import 'package:splizz/widgets/nav_bar.dart';
import 'package:splizz/utils/load_json.dart';

import 'package:splizz/pages/home/home_friends.dart';
import 'package:splizz/pages/home/home_groups.dart';

String font = 'Poppins';

class App extends StatefulWidget {
  App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _currentPageIndex = 0;

  final bottomNavItems = [
    'Groups',
    'Friends',
  ];

  @override
  void initState() {
    super.initState();
    _currentPageIndex = 0;
  }

  Widget _bottomNavigationWidget() {
    return Container(
      height: 70.h,
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      decoration: BoxDecoration(
        color: Color(0xFF111111),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          bottomNavItems.length,
          _bottomNavigationBarItem,
        ),
      ),
    );
  }

  Widget _bottomNavigationBarItem(int index) {
    var textColor =
        index == _currentPageIndex ? Color(0xFFFFFFFF) : Color(0xFFBBBBBB);

    return TextButton(
      onPressed: () {
        setState(() {
          _currentPageIndex = index;
        });
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Color(0xFF111111),
      ),
      child: Container(
        width: 120.w,
        height: 70.h,
        child: Center(
          child: Text(
            bottomNavItems[index],
            style: TextStyle(
              color: textColor,
              fontSize: 16.sp,
              fontFamily: font,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }

  Widget _bodyWidget() {
    switch (_currentPageIndex) {
      case 0:
        return StackedGroups();
      case 1:
        return Friends();
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 40.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                ),
                child: Container(
                  height: 734.h,
                  child: Column(
                    children: [
                      Container(
                        height: 40.h,
                        child: HomeTopNavBar(),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10.h),
                        height: 694.h,
                        child: _bodyWidget(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: _bottomNavigationWidget(),
    );
  }
}
