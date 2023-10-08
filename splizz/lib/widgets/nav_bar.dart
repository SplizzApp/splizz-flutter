import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeTopNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final contextSize = MediaQuery.of(context).size;
    final font = 'Poppins';

    return Container(
      height: contextSize.height * 0.04,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Hey Kyle,',
              style: TextStyle(
                color: Color(0xFF111111),
                fontSize: 28,
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
                  width: 22,
                  height: 22,
                ),
                const SizedBox(width: 15),
                SvgPicture.asset(
                  "assets/images/NotificationBlack.svg",
                  width: 22,
                  height: 22,
                ),
                const SizedBox(width: 15),
                SvgPicture.asset(
                  "assets/images/AddBlack.svg",
                  width: 22,
                  height: 22,
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
  @override
  Widget build(BuildContext context) {
    final contextSize = MediaQuery.of(context).size;
    final font = 'Poppins';

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 60),
      decoration: BoxDecoration(
        color: Color(0xFF111111),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {},
            child: TextButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: Color(0xFF111111),
              ),
              child: Text(
                'Groups',
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 18,
                  fontFamily: font,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              foregroundColor: Color(0xFF111111),
            ),
            child: Text(
              'Friends',
              style: TextStyle(
                color: Color(0xFFBBBBBB),
                fontSize: 18,
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
