import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Global Variables
const font = 'Poppins';

class ExpenseInfo {
  String name;
  int amount;

  ExpenseInfo(this.name, this.amount);
}

class GroupPage extends StatefulWidget {
  const GroupPage({super.key, required this.title});

  final String title;

  @override
  GroupPageState createState() => GroupPageState();
}

class GroupPageState extends State<GroupPage> {
  List<String> members = [];
  List<Widget> memberWidgets = [];
  List<ExpenseInfo> expenses = [];
  List<Widget> expenseWidgets = [];

  Future<void> getNewMember(BuildContext context) async {
    final TextEditingController _textController = TextEditingController();

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add New Member'),
          content: TextField(
            controller: _textController,
            decoration: InputDecoration(hintText: "John Doe"),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                addNewMember(_textController.text);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> getNewExpense(BuildContext context) async {
    final TextEditingController _textController = TextEditingController();

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add New Expense'),
          content: TextField(
            controller: _textController,
            decoration: InputDecoration(hintText: "Walmart"),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                addNewExpense(ExpenseInfo(_textController.text, 100));
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void addNewMember(String name) {
    setState(() {
      members.add(name);
      memberWidgets.add(memberElement(name));
    });
  }

  void addNewExpense(ExpenseInfo expenseInfo) {
    setState(() {
      expenses.add(expenseInfo);
      expenseWidgets.add(expenseElement(expenseInfo));
    });
  }

  int getTotalExpense() {
    int totalExpense = 0;
    for (ExpenseInfo expense in expenses) {
      totalExpense += expense.amount;
    }

    return totalExpense;
  }

  @override
  Widget build(BuildContext context) {
    final contextSize = MediaQuery.of(context).size;
    final verticalMargin = contextSize * 0.04;
    int totalExpense = getTotalExpense();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 70),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(6, 0, 0, 0),
                child: BackButton(color: Colors.black),
              ),
              // Align(
              // alignment: Alignment.centerRight,
              // child:
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 16, 0),
                child: Text(
                  'Group Name',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 40,
                    fontFamily: font,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
              // )
            ],
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: verticalMargin.width),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Expense',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontFamily: font,
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
                Text(
                  '\$$totalExpense',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 44,
                    fontFamily: font,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 100,
                      // margin: EdgeInsets.symmetric(vertical: 10),
                      child: Center(
                        child: Text(
                          'Members:',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                            fontFamily: font,
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      // width: 230,
                      // height: 40,
                      // alignment: Alignment.centerLeft,
                      // margin: EdgeInsets.symmetric(vertical: 10),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: memberWidgets,
                        ),
                      ),
                    ),
                    Container(
                      width: 30,
                      // alignment: Alignment.centerRight,
                      // margin: EdgeInsets.only(left: 10),
                      child: IconButton(
                        onPressed: () => getNewMember(context),
                        icon: SvgPicture.asset(
                          'assets/images/Union Right.svg',
                          width: 20,
                          height: 20,
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  height: 500,
                  width: double.infinity,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: BorderDirectional(top: BorderSide(width: 1.5)),
                  ),
                  child: Container(
                    // alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: expenseWidgets +
                            [addNewElementButton(getNewExpense, context)],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 70,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Next',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: font,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget memberElement(String memberName) {
  return ConstrainedBox(
    constraints: BoxConstraints(minWidth: 60),
    child: Container(
      height: 30,
      padding: EdgeInsets.symmetric(horizontal: 3),
      margin: EdgeInsets.symmetric(horizontal: 2),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.blue, width: 1.5),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Center(
        child: Text(
          memberName,
          style: TextStyle(
            color: Colors.blue,
            fontSize: 14,
            fontFamily: font,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
  );
}

Widget expenseElement(ExpenseInfo expenseInfo) {
  final int amount = expenseInfo.amount;
  return Container(
    height: 70,
    width: double.infinity,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            expenseInfo.name,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: font,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            '\$$amount',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: font,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    ),
  );
}

Widget addNewElementButton(Function onPressed, BuildContext context) {
  return Container(
    width: double.infinity,
    child: TextButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Color.fromARGB(255, 144, 181, 255),
        backgroundColor: Colors.white,
        // elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      onPressed: () => onPressed(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/newExpense.svg',
            width: 30,
            height: 30,
          ),
          Text(
            'Add New Expense',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: font,
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
        ],
      ),
    ),
  );
}
