import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new/bloc/information/bloc/information_bloc.dart';
import 'package:flutter_new/design.dart';
import 'package:flutter_new/home.dart';
import 'package:flutter_new/infromation.dart';
import 'package:flutter_new/myProfile.dart';
import 'package:flutter_new/profile1.dart';
import 'package:flutter_new/clipperTest2.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(bloc, error, stackTrace);
  }
}

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InformationBloc>(
          create: (BuildContext context) => InformationBloc(),
        ),
        // BlocProvider<InformationBloc>(
        //   create: (BuildContext context) => InformationBloc(),
        // ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Color(0xFF041c43),
        ),
        home: MyHomePage(0),
      ),
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
            label: '?????????????????????',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.paid_outlined),
            label: '??????????????????????????????????????????',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_answer_outlined),
            label: '?????????',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            label: '???????????????????????????',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '???????????????????????????????????????',
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
                    //return MyProfile();
                  },
                );
                break;
              case 1:
                return CupertinoTabView(
                  builder: (BuildContext context) {
                    // return Information();
                    return Home();
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
                    return ClipperTest();
                  },
                );
              case 4:
                return CupertinoTabView(
                  builder: (BuildContext context) {
                    return MyProfile();
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
