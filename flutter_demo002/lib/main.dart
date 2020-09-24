import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo001/HomeListPage.dart';
import 'package:flutter_demo001/dongtai.dart';
import 'package:flutter_demo001/util/ThemeColorUtils.dart';

import 'mywidgets/hometab.dart';

void main() {
  runApp(MyHome());

  // 可以在这里初始化程序信息
}


class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomeTabWidget(
      mTabs: [
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
            name: "发现",
            icons: {
              "selected": "images/ic_nav_discover_actived.png",
              "normal": "images/ic_nav_discover_normal.png"
            },
            content: HomeListPage()
        ),
        TabInfo(
            name: "我的",
            icons: {
              "selected": "images/ic_nav_my_pressed.png",
              "normal": "images/ic_nav_my_normal.png"
            },
            content: HomeListPage()
        ),
      ]);
  }
}
