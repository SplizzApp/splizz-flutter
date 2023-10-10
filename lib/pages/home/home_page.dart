import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_dash/flutter_dash.dart';

import 'package:splizz/pages/group_page.dart';
import 'package:splizz/models/group.dart';
import 'package:splizz/pages/home/home_groups.dart';
import 'package:splizz/pages/home/home_friends.dart';
import 'package:splizz/widgets/nav_bar.dart';
import 'package:splizz/utils/load_json.dart';

import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

String font = 'Poppins';

Future<List<Group>> getGroups(String filePath) async {
  List<Group> groups = [];
  // Load the JSON file from the assets directory
  final jsonString = await rootBundle.loadString(filePath);
  // Parse the JSON data
  final List<dynamic> jsonData = json.decode(jsonString);
  for (var group_map in jsonData) {
    groups.add(Group.fromJson(group_map));
  }

  // sleep(Duration(seconds: 3));
  return groups;
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final Future<List<Group>> groups = getGroups('assets/test_data/groups.json');

  @override
  Widget build(BuildContext context) {
    final contextSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
            future: groups,
            builder:
                (BuildContext context, AsyncSnapshot<List<Group>> snapshot) {
              if (snapshot.hasData) {
                var loadedGroups = [];
                for (var group in snapshot.data!) {
                  loadedGroups.add(group);
                }
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: contextSize.height * 0.04,
                          ),
                          Container(
                            height: contextSize.height * 0.72,
                            child: CustomScrollView(
                              slivers: [
                                SliverAppBar(
                                  backgroundColor: Color(0xFFFFFFFF),
                                  automaticallyImplyLeading: false,
                                  floating: true,
                                  snap: true,
                                  pinned: false,
                                  primary: false,
                                  stretchTriggerOffset: 100.h,
                                  toolbarHeight: 50.h,
                                  flexibleSpace: Center(child: HomeTopNavBar()),
                                ),
                                SliverStickyHeader(
                                  header: mainGroup(group: loadedGroups[0]),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: contextSize.height * 0.15,
                            child: Stack(
                              children: List.generate(
                                loadedGroups.length,
                                (index) {
                                  return Positioned(
                                    top: 20.h * index,
                                    child:
                                        mainGroup(group: loadedGroups[index]),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Color(0xFF011111),
                    strokeWidth: 2.0,
                  ),
                );
              }
            },
          ),
          Container(
            alignment: Alignment(0.0, 1.0),
            child: HomeBottomNavBar(
              groupTextColor: Color(0xFFFFFFFF),
              friendsTextColor: Color(0xFFBBBBBB),
            ),
          ),
        ],
      ),
    );
  }
}
