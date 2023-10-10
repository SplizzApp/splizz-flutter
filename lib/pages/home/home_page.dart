import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_dash/flutter_dash.dart';

import 'package:splizz/models/group.dart';
import 'package:splizz/pages/home/home_groups.dart';
import 'package:splizz/widgets/nav_bar.dart';
import 'package:splizz/utils/load_json.dart';

String font = 'Poppins';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final Future<List<Group>> groups = getGroups('assets/test_data/groups.json');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
            future: groups,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    SizedBox(
                      height: 40.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                      ),
                      child: Column(
                        children: [
                          Container(
                            // color: Colors.lightGreenAccent,
                            height: 700.h,
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
                                  header: mainGroup(group: snapshot.data![0]),
                                ),
                                SliverToBoxAdapter(
                                  child: Container(
                                    height: 1000.h,
                                    child: Stack(
                                      children: List.generate(
                                        snapshot.data!.length,
                                        (index) {
                                          // var group = snapshot.data![index];
                                          return Positioned(
                                            top: 200.h * index,
                                            child: mainGroup(
                                              group: snapshot.data![index],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
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
