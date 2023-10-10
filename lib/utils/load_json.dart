import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

Future<List<Map<String, dynamic>>> loadListJson(String filePath) async {
  // Load the JSON file from the assets directory
  final jsonString = await rootBundle.loadString(filePath);

  // Parse the JSON data
  final List<Map<String, dynamic>> jsonData = json.decode(jsonString);

  return jsonData;
}
