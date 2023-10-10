import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import 'package:splizz/models/group.dart';
import 'package:splizz/models/user.dart';

Future<List<Group>> getGroups(String filePath) async {
  List<Group> groups = [];
  // Load the JSON file from the assets directory
  final jsonString = await rootBundle.loadString(filePath);
  // Parse the JSON data
  final List<dynamic> jsonData = json.decode(jsonString);

  for (var group_map in jsonData) {
    groups.add(Group.fromJson(group_map));
  }

  return groups;
}

Future<List<User>> getUsers(String filePath) async {
  List<User> users = [];
  // Load the JSON file from the assets directory
  final jsonString = await rootBundle.loadString(filePath);
  // Parse the JSON data
  final List<dynamic> jsonData = json.decode(jsonString);

  for (var user_map in jsonData) {
    users.add(User.fromJson(user_map));
  }

  return users;
}
