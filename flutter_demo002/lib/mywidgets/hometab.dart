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

  final TextStyle tabTextStyleSelected;

  final TextStyle tabTextStyleNormal;

  final PreferredSizeWidget appBar;

  final ValueChanged<TabInfo> onTabChange;

  final int initIndex;

  HomeTabWidget({@required this.mTabs,
    this.tabTextStyleSelected = const TextStyle(color: const Color(0xff3B9AFF)),
    this.tabTextStyleNormal = const TextStyle(color: const Color(0xff969696)),
    this.themeColor,
    this.appBar,
    this.onTabChange,
    this.initIndex = 0});

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

  int _currentDisplayTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentDisplayTabIndex = widget.initIndex;
  }

  static Image _getImage(path) {
    return Image.asset(path, width: 20.0, height: 20.0);
  }

  TextStyle _getTabTextStyle(int curIndex) {
    if (curIndex == _currentDisplayTabIndex) {
      return widget.tabTextStyleSelected;
    }
    return widget.tabTextStyleNormal;
  }

  Image _getTabIcon(int curIndex) {
    //设置tabbar选中和未选中的状态图标
    var tab = widget.mTabs[curIndex];

    if (curIndex == _currentDisplayTabIndex) {
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
    final tabs = widget.mTabs;

    final _body = IndexedStack(
      children: tabs.map((e) => e.content).toList(),
      index: _currentDisplayTabIndex,
    );

    final List<BottomNavigationBarItem> bottomBars = [];
    for (int i = 0; i < tabs.length; i++) {
      bottomBars.add(BottomNavigationBarItem(icon: _getTabIcon(i),
          title: _getTabTitle(i)
      ));
    }


    return Scaffold(
      //布局结构
      appBar: widget.appBar,
      body: _body,
      bottomNavigationBar: CupertinoTabBar(
        //
        items: bottomBars,
        currentIndex: _currentDisplayTabIndex,
        onTap: (index) {
          setState(() {
            _currentDisplayTabIndex = index;
          });

          widget.onTabChange?.call(widget.mTabs[index]);
        },
      ),
    );
  }
}
