import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_dash/flutter_dash.dart';

import 'package:splizz/pages/group_page.dart';
import 'package:splizz/models/group.dart';

class mainGroup extends StatelessWidget {
  final font = 'Poppins';

  Group group;

  mainGroup({required this.group});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 358.w,
      height: 510.h,
      margin: EdgeInsets.symmetric(vertical: 30.h),
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
              SizedBox(
                height: 120.h,
              ),
              Center(
                child: Text(
                  group.name,
                  style: TextStyle(
                    color: Color(0xFF111111),
                    fontSize: 22.sp,
                    fontFamily: font,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Dash(
                  direction: Axis.horizontal,
                  length: 310.h,
                  dashLength: 6.0,
                  dashGap: 6.0,
                  dashBorderRadius: 2,
                  dashThickness: 1,
                  dashColor: Color(0xFFDBDDE0),
                ),
              ),
              SizedBox(
                height: 36.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 18.h,
                          child: Text(
                            'Start Date',
                            style: TextStyle(
                              color: Color(0xFF707070),
                              fontSize: 13.sp,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                        Container(
                          height: 18.h,
                          child: Text(
                            'Mar 22, 2023',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF111111),
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 18.h,
                          child: Text(
                            'End Date',
                            style: TextStyle(
                              color: Color(0xFF707070),
                              fontSize: 13.sp,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                        Container(
                          height: 18.h,
                          child: Text(
                            'Mar 22, 2023',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF111111),
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 18.h,
                          child: Text(
                            'Members',
                            style: TextStyle(
                              color: Color(0xFF707070),
                              fontSize: 13.sp,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                        Container(
                          height: 18.h,
                          child: Text(
                            'Kyle, James, Sarah, ...',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF111111),
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Dash(
                  direction: Axis.horizontal,
                  length: 310.0.h,
                  dashLength: 6.0,
                  dashGap: 6.0,
                  dashBorderRadius: 2,
                  dashThickness: 1,
                  dashColor: Color(0xFFDBDDE0),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 24.h,
                      child: Text(
                        'Total Amount',
                        style: TextStyle(
                          color: Color(0xFF707070),
                          fontSize: 18.sp,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                    Container(
                      height: 24.h,
                      child: Text(
                        'CAD \$1,000,000',
                        style: TextStyle(
                          color: Color(0xFF111111),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 32.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24.w),
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
              SizedBox(
                height: 48.h,
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 24.w),
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
                    width: 20.w,
                    height: 20.h,
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
