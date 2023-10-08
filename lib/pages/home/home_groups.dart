import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_dash/flutter_dash.dart';

import '../group_page.dart';
import '../../models/group.dart';

class mainGroup extends StatelessWidget {
  final font = 'Poppins';

  Group group;

  mainGroup({required this.group});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 358,
      height: 510,
      margin: EdgeInsets.symmetric(vertical: 30),
      child: Stack(
        children: [
          Positioned(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 0,
                    blurRadius: 4,
                    offset: Offset(1, 0), // changes position of shadow
                  ),
                ],
              ),
              child: SvgPicture.asset(
                'assets/images/MainReceipt.svg',
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 136,
              ),
              Center(
                child: Text(
                  group.name,
                  style: TextStyle(
                    color: Color(0xFF111111),
                    fontSize: 28,
                    fontFamily: font,
                    fontWeight: FontWeight.w600,
                    height: 0.07,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Dash(
                  direction: Axis.horizontal,
                  length: 310.0,
                  dashLength: 6.0,
                  dashGap: 6.0,
                  dashBorderRadius: 2,
                  dashThickness: 1,
                  dashColor: Color(0xFFDBDDE0),
                ),
              ),
              const SizedBox(
                height: 36,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 18,
                          child: Text(
                            'Start Date',
                            style: TextStyle(
                              color: Color(0xFF707070),
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              height: 0.11,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 18,
                          child: Text(
                            'Mar 22, 2023',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF111111),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                              height: 0.11,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 18,
                          child: Text(
                            'End Date',
                            style: TextStyle(
                              color: Color(0xFF707070),
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              height: 0.11,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 18,
                          child: Text(
                            'Mar 22, 2023',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF111111),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                              height: 0.11,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 18,
                          child: Text(
                            'Members',
                            style: TextStyle(
                              color: Color(0xFF707070),
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              height: 0.11,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 18,
                          child: Text(
                            'Kyle, James, Sarah, ...',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF111111),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                              height: 0.11,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Dash(
                  direction: Axis.horizontal,
                  length: 310.0,
                  dashLength: 6.0,
                  dashGap: 6.0,
                  dashBorderRadius: 2,
                  dashThickness: 1,
                  dashColor: Color(0xFFDBDDE0),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 18,
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Total Amount',
                          style: TextStyle(
                            color: Color(0xFF707070),
                            fontSize: 18,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 18,
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'CAD \$1,000,000',
                          style: TextStyle(
                            color: Color(0xFF111111),
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 0.5,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: Color(0xFFF3F3F3),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 48,
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GroupPage(title: "name"),
                      ),
                    );
                  },
                  style:
                      ElevatedButton.styleFrom(foregroundColor: Colors.white),
                  child: SvgPicture.asset(
                    'assets/images/enlargeReceipt.svg',
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class StackedGroup extends StatelessWidget {
  final String font = 'Poppins';
  final Group group;
  final Color bgColor;

  const StackedGroup({
    super.key,
    required this.group,
    required this.bgColor,
  });

  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      child: mainGroup(group: group),
    );
  }
}
