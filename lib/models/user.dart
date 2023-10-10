// import 'package:json_annotation/json_annotation.dart';
import 'dart:ui';

// @JsonSerializable()
class User {
  final String uid;
  final String email;
  final String name;

  // final Color? color;

  // final String? profilePic;

  User({
    required this.uid,
    required this.email,
    required this.name,
    // this.color,
    // this.profilePic,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uid: json['uid'],
      email: json['email'],
      name: json['name'],
      // color: json['color'],
      // profilePic: json['profilePic'],
    );
  }
}
