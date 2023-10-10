import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:splizz/pages/welcome_page.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) =>
              LoggedOut(title: 'Splizz'),
          transitionDuration: Duration(seconds: 1),
          transitionsBuilder: (context, animation1, animation2, child) {
            return FadeTransition(
              opacity: animation1,
              child: child,
            );
          },
        ),
        // MaterialPageRoute(builder: (context) => LoggedOut(title: 'BeShare')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.00, -1.00),
            end: Alignment(0, 1),
            colors: [
              Color(0xFF010101),
              Color(0xFF010101),
            ],
          ),
        ),
        child: Center(
          child: Text(
            'Splizz',
            style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: 36.sp,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
