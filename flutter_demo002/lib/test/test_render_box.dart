




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class TestRenderBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget current = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("这所以算法地方阿萨德发"),
        Container(
          height: 300,
          color: Colors.red,
        ),

        MyRenderWidget(),
      ],
    );

    current = Container(
      child: current,
    );

    // Colors.lightGreen[300];



    RenderImage ri;

    current = Scaffold(
      appBar: AppBar(title: Text("TestRenderBox"),),
      body: current,
    );

    return current;
  }

}



///
/// 一个自定义的RenderObjectWidget
///
class MyRenderWidget extends LeafRenderObjectWidget {

  final Color color;


  MyRenderWidget({this.color = Colors.red});

  @override
  RenderObject createRenderObject(BuildContext context) {
    final obj = MyRenderObject();
    obj.color = color;
    return obj;
  }

  @override
  void updateRenderObject(BuildContext context, covariant RenderObject renderObject) {
    (renderObject as MyRenderObject).color = color;
  }
}


class MyRenderObject extends RenderBox {

  Color color;

  @override
  void performLayout() {
    // super.performLayout();
    size = Size(
      constraints.constrainWidth(200),
      constraints.constrainHeight(200),
    );
  }


  @override
  void performResize() {
    // super.performResize();
    // size = constraints.biggest;
  }

  @override
  bool get sizedByParent => true;

  @override
  void paint(PaintingContext context, Offset offset) {
    super.paint(context, offset);

    final canvas = context.canvas;
    canvas.save();

    canvas.translate(offset.dx, offset.dy);

    Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    print("size:$size");

    context.canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
    canvas.restore();
  }
}

void main() {

  print("hello");
}