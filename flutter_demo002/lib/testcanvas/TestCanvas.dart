




import 'package:flutter/material.dart';
import 'package:flutter_demo001/mywidgets/base_page.dart' as base_page;




class TestPaint extends base_page.Page {

  void test() {
    Container();
    Row();
  }

  TestPaint() {
    title = "Test";
    content = Container(
      color: Colors.blue,
      margin: EdgeInsets.only(top: 100),
      child: CustomPaint(
        foregroundPainter: MyPainter(),
      ),
    );
  }
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
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke
      ..color = Colors.red;
    //
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