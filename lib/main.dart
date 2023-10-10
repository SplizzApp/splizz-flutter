// External Imports
// Firebase
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// Flutter
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Local Imports
// Pages
import 'package:splizz/pages/splash_page.dart';
import 'package:splizz/pages/home/home_friends.dart';
import 'package:splizz/pages/home/home_page.dart';

// Config
import 'package:splizz/config/text_styles.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await ScreenUtil.ensureScreenSize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390.0, 844.0),
      builder: (context, child) {
        return MaterialApp(
          title: 'Splizz',
          theme: ThemeData(
            scaffoldBackgroundColor: Color(0xFFFFFFFF),
            textTheme: textTheme,
          ),
          home: SplashPage(),
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: child!,
            );
          },
          routes: {
            '/home/groups': (context) => HomePage(),
            '/home/friends': (context) => HomeFriends(),
          },
        );
      },
    );
  }
}
