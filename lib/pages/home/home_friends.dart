import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:splizz/models/user.dart';
import 'package:splizz/widgets/nav_bar.dart';
import 'package:splizz/utils/load_json.dart';

String font = 'Poppins';

class HomeFriends extends StatelessWidget {
  HomeFriends({super.key});

  final Future<List<User>> friends = getUsers('assets/test_data/friends.json');

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
                child: Column(
                  children: [
                    HomeTopNavBar(),
                    Container(
                      height: 10.h,
                    ),
                    Container(
                      height: 700.h,
                      child: FutureBuilder(
                        future: friends,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.separated(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.vertical,
                              itemCount: snapshot.data!.length,
                              separatorBuilder: (context, index) => Divider(
                                color: Color(0xFF707070),
                                height: 1.h,
                              ),
                              itemBuilder: (context, index) {
                                var friend = snapshot.data![index];
                                var absBalance = friend.balance.abs();
                                var isPositive = friend.balance >= 0;
                                var prefix =
                                    isPositive ? 'Owes you' : 'You owe';
                                var color = isPositive
                                    ? Color(0xFF00B341)
                                    : Color(0xFFE60000);
                                return Container(
                                  height: 40.h,
                                  child: TextButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFFFFFFFF),
                                      foregroundColor: Color(0xFFFFFFFF),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          friend.name,
                                          style: TextStyle(
                                            color: Color(0xFF111111),
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Poppins',
                                          ),
                                        ),
                                        Text(
                                          '$prefix CAD \$$absBalance',
                                          style: TextStyle(
                                            color: color,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Poppins',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: Color(0xFF111111),
                                strokeWidth: 2.0,
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment(0.0, 1.0),
            child: HomeBottomNavBar(
              groupTextColor: Color(0xFFBBBBBB),
              friendsTextColor: Color(0xFFFFFFFF),
            ),
          ),
        ],
      ),
    );
  }
}
