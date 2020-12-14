import 'package:flutter/cupertino.dart';
import 'package:flutter_demo001/myframework/TestMyFramework.dart';
import 'package:flutter_demo001/mywidgets/testmenu_widget.dart';
import 'package:flutter_demo001/test/test_layout.dart';
import 'package:flutter_demo001/testcanvas/TestCanvas.dart';
import 'package:flutter_demo001/util/TNavigator.dart';

///
/// 一个可以添加测试入口的界面
///
class TestMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MenuWidget(menus: [
      Menu("Test"),
      Menu("绘制", () {
        TNavigator.push(context, TestPaint());
      }),
      Menu("MyFramework", () {
        TNavigator.push(context, TestMyFramework());
      }),
      Menu("TestFlutterPlugin", () {
        // final version = FlutterPlugin.platformVersion;
        // print("version:$version");
      }),
      Menu("Test Layout", () {
        TNavigator.push(context, TestLayout());

      })
    ]);
  }
}
