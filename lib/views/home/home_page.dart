import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_dash/flutter_dash.dart';

import '../../models/group.dart';
import '../group_page.dart';
import 'home_groups.dart';
import 'home_friends.dart';
import '../../widgets/nav_bar.dart';

String font = 'Poppins';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final contextSize = MediaQuery.of(context).size;

    List<Group> groups = [
      Group(
        name: "Toronto Dinner",
        gid: 0,
        owner_id: 0,
        members: [0, 1, 2],
        expeneses: ["Dinner", "Drinks"],
      ),
      Group(
        name: "UWaterloo",
        gid: 1,
        owner_id: 0,
        members: [0, 1, 2],
        expeneses: ["lab_equipment", "textbooks"],
      ),
      Group(
        name: "Trip",
        gid: 2,
        owner_id: 0,
        members: [0, 1, 2],
        expeneses: ["flight", "accommodation"],
      ),
      Group(
        name: "Korean BBQ",
        gid: 3,
        owner_id: 0,
        members: [0, 1, 2],
        expeneses: ["food", "drinks"],
      ),
    ];

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(
                  height: contextSize.height * 0.02,
                ),
                Container(
                  height: contextSize.height * 0.74,
                  child: CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        backgroundColor: Color(0xFFFFFFFF),
                        automaticallyImplyLeading: false,
                        floating: true,
                        snap: true,
                        pinned: false,
                        stretchTriggerOffset: 100.0,
                        expandedHeight: contextSize.height * 0.04,
                        flexibleSpace: FlexibleSpaceBar(
                          background: HomeTopNavBar(),
                        ),
                      ),
                      SliverStickyHeader(
                        header: mainGroup(group: groups[2]),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: contextSize.height * 0.15,
                  child: Stack(
                    children: List.generate(
                      groups.length,
                      (index) {
                        return Positioned(
                          top: 30.0 * index,
                          child: mainGroup(group: groups[index]),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: contextSize.height * 0.09,
            child: HomeBottomNavBar(),
          ),
        ],
      ),
    );
  }
}

// [
// StackedGroup(
// 'Ecobee',
// Color(0xFF2663FF),
// Colors.white,
// ),
// StackedGroup(
// 'Uwaterloo',
// Colors.black,
// Color(0xFF2663FF),
// ),
// StackedGroup(
// 'Grad26',
// Colors.purple,
// Colors.black,
// ),
// StackedGroup(
// '토론토',
// Colors.redAccent,
// Colors.purple,
// ),
// ],
