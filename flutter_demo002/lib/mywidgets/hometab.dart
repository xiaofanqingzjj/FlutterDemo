



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


///
///
///  一个首页tab框架
///
///
class HomeTabWidget extends StatefulWidget {

  final List<TabInfo> mTabs;

  final Color themeColor; // = ThemeColorUtils.currentColorTheme;//设置主题标题背景颜色

  TextStyle tabTextStyleSelected = TextStyle(color: const Color(0xff3B9AFF));
  TextStyle tabTextStyleNormal = TextStyle(color: const Color(0xff969696));

  PreferredSizeWidget appBar;

  ValueChanged<TabInfo> onTabChange;

  int initIndex = 0;

  HomeTabWidget({this.mTabs,
    this.tabTextStyleSelected,
    this.tabTextStyleNormal,
    this.themeColor,
    this.appBar,
    this.onTabChange,
    this.initIndex
  });

  @override
  State<StatefulWidget> createState() => _HomeTabWidgetState();


}

///
///  TabInfo
///
class TabInfo {
  String name;
  Map icons;
  Widget content;

  TabInfo({this.name, this.icons, this.content});
}


class _HomeTabWidgetState extends State<HomeTabWidget> {

  int _tabIndex = 0;
  var _body;

  _HomeTabWidgetState() {

  }


  @override
  void initState() {
    super.initState();
    _tabIndex = widget.initIndex;
  }

  Image _getImage(path) {
    return Image.asset(path, width: 20.0, height: 20.0);
  }

  TextStyle _getTabTextStyle(int curIndex) {//设置tabbar 选中和未选中的状态文本
    if (curIndex == _tabIndex) {
      return widget.tabTextStyleSelected;
    }
    return widget.tabTextStyleNormal;
  }

  Image _getTabIcon(int curIndex) {//设置tabbar选中和未选中的状态图标
    var tab = widget.mTabs[curIndex];

    if (curIndex == _tabIndex) {
      return _getImage(tab.icons["selected"]);
    } else {
      return _getImage(tab.icons["normal"]);
    }
  }

  Text _getTabTitle(int curIndex) {
    return Text(widget.mTabs[curIndex].name, style: _getTabTextStyle(curIndex));
  }


  @override
  Widget build(BuildContext context) {



    _body = IndexedStack(
      children: widget.mTabs.map((e) => e.content).toList(),
      index: _tabIndex,
    );

    return MaterialApp(
      theme: ThemeData(
          primaryColor: widget.themeColor
      ),
      home: Scaffold(//布局结构
        appBar: widget.appBar,
//        appBar:

        body: _body,

        bottomNavigationBar: CupertinoTabBar(//
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: _getTabIcon(0),
                title: _getTabTitle(0)),
            BottomNavigationBarItem(
                icon: _getTabIcon(1),
                title: _getTabTitle(1)),
            BottomNavigationBarItem(
                icon: _getTabIcon(2),
                title: _getTabTitle(2)),
            BottomNavigationBarItem(
                icon: _getTabIcon(3),
                title: _getTabTitle(3)),
          ],
          currentIndex: _tabIndex,
          onTap: (index) {

            setState((){
              _tabIndex = index;
            });

            widget.onTabChange?.call(widget.mTabs[index]);
          },
        ),
      ),
    );
  }
}