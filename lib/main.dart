import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_new/design.dart';
import 'package:flutter_new/infromation.dart';
import 'package:flutter_new/profile1.dart';
import 'package:flutter_new/test2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFF041c43),
      ),
      home: MyHomePage(0),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage(this.index);
  int index;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectIndex = 0;
  CupertinoTabController? tabController;

  @override
  void initState() {
    initData();
    super.initState();
  }

  void initData() {
    setState(() {
      tabController = CupertinoTabController(initialIndex: widget.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'หน้าแรก',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.paid_outlined),
            label: 'วงเงินสินเชือ่',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_answer_outlined),
            label: 'แชท',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            label: 'แจ้งเตือน',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'ข้อมูลส่วนตัว',
          ),
        ],
      ),
      controller: tabController,
      tabBuilder: (BuildContext context, int index) {
        // _selectedIndex = index;
        return CupertinoTabView(
          builder: (BuildContext context) {
            switch (tabController!.index) {
              case 0:
                return CupertinoTabView(
                  builder: (BuildContext context) {
                    return Profile1();
                  },
                );
                break;
              case 1:
                return CupertinoTabView(
                  builder: (BuildContext context) {
                    return Information();
                  },
                );
                break;
              case 2:
                return CupertinoTabView(
                  builder: (BuildContext context) {
                    return Design();
                  },
                );
                break;
              case 3:
                return CupertinoTabView(
                  builder: (BuildContext context) {
                    return Test2();
                  },
                );
              case 4:
                return CupertinoTabView(
                  builder: (BuildContext context) {
                    return Text("test");
                  },
                );

                break;
              default:
                return Container();
            }
          },
        );
      },
    );
  }
}
