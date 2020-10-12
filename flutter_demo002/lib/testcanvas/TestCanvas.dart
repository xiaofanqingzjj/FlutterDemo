




import 'package:flutter/material.dart';
import 'package:flutter_demo001/mywidgets/base_page.dart';


void test() {
  CustomPaint cp;
}


class MyPaint extends CustomPaint {

}


class TestPaint extends Page {

  void test() {
    Container();
    Row();
  }

  TestPaint() {
    title = "Test";
    content = Container(
      child: CustomPaint(
        foregroundPainter: MyPainter(),
      ),
    );
  }
}

void test1() {

  RenderObjectWidget row;
//  RenderBox
}


///
/// 一个绘制Demo
///
class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    print("size:$size");

    /// 初始化画笔
    var paint = Paint()
      ..strokeWidth = 25.0
      ..color = Colors.red;

    /// 通过canvas画一条直线
    /// 这里可以根据需要绘制圆形,矩形等等
//    canvas.drawLine(Offset(95, 0), Offset(95, 300), paint);
    
    canvas.drawRect(Rect.fromLTRB(0, 0, 100, 100), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}