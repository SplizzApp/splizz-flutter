// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'config/text_styles.dart';

import 'views/splash_page.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splizz',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFFFFFFF),
        textTheme: textTheme,
      ),
      home: SplashPage(),
    );
  }
}
