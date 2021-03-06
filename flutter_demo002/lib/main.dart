import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo001/hometab/HomeListPage.dart';
import 'package:flutter_demo001/hometab/dongtai.dart';
import 'package:flutter_demo001/test/test_menus.dart';

import 'mywidgets/hometab.dart';

void main() {

  // runApp(A());
  runApp(new App());

  // 可以在这里初始化程序信息
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Row r;
    return MaterialApp(
        home: MyHome(),
    );
  }

}

class MyHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomeState();
  }

  @override
  StatefulElement createElement() {
    return super.createElement();
  }
}


class _MyHomeState extends State<MyHome> {
  String title = "";

  int _initIndex = 1;

  List<TabInfo> mTabs = [
    TabInfo(
        name: "测试",
        icons: {
          "selected": "images/ic_nav_discover_actived.png",
          "normal": "images/ic_nav_discover_normal.png"
        },
        content: TestMenu()
    ),
    TabInfo(
        name: "星球",
        icons: {
          "selected": "images/ic_nav_news_actived.png",
          "normal": "images/ic_nav_news_normal.png"
        },
        content: HomeListPage()
    ),
  ];

  @override
  void initState() {
    super.initState();
    title = mTabs[_initIndex].name;

    Container c;
    Image I;
  }

  @override
  Widget build(BuildContext context) {
    return HomeTabWidget(
      appBar: AppBar(//选中每一项的标题和图标设置
        title: Text(title,
            style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.red,
      ),
      mTabs: mTabs,
      initIndex: _initIndex,

      onTabChange: (tab) {
        setState(() {
          title = tab.name;
        });
      },
    );
  }
}
