


import 'package:flutter/cupertino.dart';
import 'package:flutter_demo001/myframework/TestMyFramework.dart';
import 'package:flutter_demo001/mywidgets/testmenu_widget.dart';
import 'package:flutter_demo001/testcanvas/TestCanvas.dart';
import 'package:flutter_demo001/util/TNavigator.dart';
import 'package:flutter_plugin/flutter_plugin.dart';

///
/// 一个可以添加测试入口的界面
///
class TestMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MenuWidget(menus :
      [
        Menu(
          name: "Test"
        ),
        Menu(
          name: "绘制",
          onClick: (menu, context) {
            TNavigator.push(context, TestPaint()) ;
          }
        ),

        Menu(
            name: "MyFramework",
            onClick: (menu, context) {
              TNavigator.push(context, TestMyFramework()) ;
            }
        ),
        Menu(name: "TestFlutterPlugin", onClick: (menu, context) {
          final version = FlutterPlugin.platformVersion;
          print("version:$version");
        }),
      ]
    );
  }

}