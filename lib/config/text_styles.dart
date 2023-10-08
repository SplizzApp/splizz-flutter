import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String _main_font = 'Poppins';

TextTheme textTheme = TextTheme(
  displayLarge: TextStyle(
    fontSize: 72.0,
    fontFamily: _main_font,
    fontWeight: FontWeight.w600,
  ),
  titleLarge: TextStyle(
    fontSize: 32.0,
    fontFamily: _main_font,
    fontWeight: FontWeight.w600,
  ),
  titleMedium: TextStyle(
    fontSize: 24.0,
    fontFamily: _main_font,
    fontWeight: FontWeight.w600,
  ),
  bodyMedium: TextStyle(
    fontSize: 14.0,
    fontFamily: _main_font,
    fontWeight: FontWeight.w400,
  ),
);
