import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:splizz/pages/home/home_friends.dart';

class HomeTopNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final font = 'Poppins';

    return Container(
      height: 40.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Hey Kyle,',
              style: TextStyle(
                color: Color(0xFF111111),
                fontSize: 22.sp,
                fontFamily: font,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/images/searchBlack.svg",
                  width: 22.w,
                  height: 22.h,
                ),
                SizedBox(width: 15.w),
                SvgPicture.asset(
                  "assets/images/NotificationBlack.svg",
                  width: 22.w,
                  height: 22.h,
                ),
                SizedBox(width: 15.w),
                SvgPicture.asset(
                  "assets/images/AddBlack.svg",
                  width: 22.w,
                  height: 22.h,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HomeBottomNavBar extends StatelessWidget {
  final Color groupTextColor;
  final Color friendsTextColor;

  HomeBottomNavBar(
      {required this.groupTextColor, required this.friendsTextColor});

  @override
  Widget build(BuildContext context) {
    final font = 'Poppins';

    return Container(
      height: 80.h,
      padding: EdgeInsets.symmetric(horizontal: 60.w),
      decoration: BoxDecoration(
        color: Color(0xFF111111),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/home/groups');
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Color(0xFF111111),
            ),
            child: Text(
              'Groups',
              style: TextStyle(
                color: groupTextColor,
                fontSize: 18.sp,
                fontFamily: font,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/home/friends');
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Color(0xFF111111),
            ),
            child: Text(
              'Friends',
              style: TextStyle(
                color: friendsTextColor,
                fontSize: 18.sp,
                fontFamily: font,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
