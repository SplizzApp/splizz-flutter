import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// import 'package:flutter_sticky_header/flutter_sticky_header.dart';
// import 'package:flutter_svg/flutter_svg.dart';

import 'package:splizz/models/user.dart';
import 'package:splizz/utils/load_json.dart';

String font = 'Poppins';

class Friends extends StatelessWidget {
  Friends({super.key});

  final Future<List<User>> friends = getUsers('assets/test_data/friends.json');

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: friends,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.separated(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            itemCount: snapshot.data!.length,
            separatorBuilder: (context, index) => Divider(
              color: Color(0xFFFFFFFF),
              // color: Color(0xFF707070),
              height: 1.h,
            ),
            itemBuilder: (context, index) {
              var friend = snapshot.data![index];
              return _friendItem(friend);
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
    );
  }
}

Widget _friendItem(User friend) {
  var absBalance = friend.balance.abs();
  var isPositive = friend.balance >= 0;
  var prefix = isPositive ? 'Owes you' : 'You owe';
  var color = isPositive ? Color(0xFF00B341) : Color(0xFFE60000);

  return Container(
    height: 70.h,
    child: TextButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFFFFFFF),
        foregroundColor: Color(0xFFFFFFFF),
        padding: EdgeInsets.all(0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: Color(0xFFBBBBBB),
                  radius: 20.w,
                ),
                Container(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      friend.name,
                      style: TextStyle(
                        color: Color(0xFF111111),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Text(
                      friend.email,
                      style: TextStyle(
                        color: Color(0xFFBBBBBB),
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
              ],
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
}
