import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:splizz/pages/home/home_page.dart';

class LoggedOut extends StatefulWidget {
  const LoggedOut({super.key, required this.title});

  final String title;

  @override
  State<LoggedOut> createState() => _LoggedOutState();
}

class _LoggedOutState extends State<LoggedOut> {
  @override
  Widget build(BuildContext context) {
    return loggedOut(context);
  }
}

Widget loggedOut(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.white,
    body: Stack(
      children: [
        Center(child: centerLogo),
        Container(
          alignment: const Alignment(0.0, 0.85),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buttonContainer(
                context,
                'LOG IN',
                Color(0xFFFFFFFF),
                Color(0xFF010101),
                Color(0xFF010101),
              ),
              buttonContainer(
                context,
                'REGISTER',
                Color(0xFF010101),
                Color(0xFFFFFFFF),
                Color(0xFFFFFFFF),
              ),
            ],
          ),
        )
      ],
    ),
  );
}

Widget centerLogo = Container(
  padding: EdgeInsets.symmetric(horizontal: 55.h),
  child: Text(
    'Splizz',
    style: TextStyle(
      color: Color(0xFF010101),
      fontSize: 48.sp,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
    ),
  ),
);

Widget buttonContainer(
  context,
  String text,
  backgroundColor,
  borderColor,
  textColor,
) {
  return Container(
    width: 170.w,
    height: 55.h,
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(6)),
      border: Border.all(color: borderColor, width: 2),
      color: backgroundColor,
    ),
    child: TextButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: backgroundColor,
        // elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      onPressed: () {
        Navigator.pushReplacementNamed(context, '/home/groups');
      },
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontFamily: 'Poppins',
          fontSize: 14.sp,
        ),
      ),
    ),
  );
}
