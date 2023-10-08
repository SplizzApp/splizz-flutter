import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class searchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 310,
          height: 40,
          margin: EdgeInsets.symmetric(vertical: 5),
          padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                child: Icon(
                  color: Colors.grey,
                  Icons.search_outlined,
                ),
              ),
              Container(
                width: 255,
                child: Center(
                  child: TextField(
                    // enabled: false,
                    cursorHeight: 18,
                    decoration: InputDecoration(
                      isDense: true,
                      alignLabelWithHint: true,
                      hintText: 'Search',
                      border: InputBorder.none,
                      hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

Widget addNewElementButton(Function onPressed, BuildContext context) {
  return Container(
    width: 40,
    height: 40,
    decoration: ShapeDecoration(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
    ),
    child: TextButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Color(0xFF2662FF),
        backgroundColor: Colors.white,
        // elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      onPressed: () => onPressed(),
      child: SvgPicture.asset(
        'assets/images/Union Right.svg',
        width: 30,
        height: 30,
      ),
    ),
  );
}
