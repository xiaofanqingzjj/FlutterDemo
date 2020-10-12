import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo001/HomeListPage.dart';
import 'package:flutter_demo001/dongtai.dart';
import 'package:flutter_demo001/mywidgets/testmenu_widget.dart';
import 'package:flutter_demo001/test/TestListView.dart';

import 'mywidgets/hometab.dart';

void main() {
  runApp(new App());

  // 可以在这里初始化程序信息
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: MyHome(),
    );
  }

}

class MyHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return  MyHomeState();
  }
}


class MyHomeState extends State<MyHome> {


  String title = "";

  int _initIndex = 1;

  List<TabInfo> mTabs = [
    TabInfo(
        name: "星球",
        icons: {
          "selected": "images/ic_nav_news_actived.png",
          "normal": "images/ic_nav_news_normal.png"
        },
        content: HomeListPage()
    ),
    TabInfo(
        name: "动态",
        icons: {
          "selected": "images/ic_nav_tweet_normal.png",
          "normal": "images/ic_nav_tweet_normal.png"
        },
        content: dongtai()
    ),
    TabInfo(
        name: "发现1",
        icons: {
          "selected": "images/ic_nav_discover_actived.png",
          "normal": "images/ic_nav_discover_normal.png"
        },
        content: MenuWidget(menus : [
          Menu(
            name: "ListView",
          ),
          Menu(
            name: "Test Navigator",
            onClick: (menu, context) {
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return PageWidget();
              }));
            }

          )

        ])
    ),
    TabInfo(
        name: "我的",
        icons: {
          "selected": "images/ic_nav_my_pressed.png",
          "normal": "images/ic_nav_my_normal.png"
        },
        content: HomeListPage()
    ),
  ];

  @override
  void initState() {
    super.initState();

    title = mTabs[_initIndex].name;
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
