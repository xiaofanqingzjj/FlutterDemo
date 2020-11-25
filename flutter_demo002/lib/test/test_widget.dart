



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';





///
///
/// 
/// 这个Demo用来分析Widget和Element的执行过程
///
///
///
///
///
///
///
///
///


class TestStatelessElement extends StatelessElement {

  static const TAG = "TestStatelessElement";

  String name;

  TestStatelessElement(StatelessWidget widget, [this.name]) : super(widget) {
    print("$TAG: $name Element constructor");
  }

  @override
  Widget build() {
    print("$TAG: $name build");
    return super.build();
  }

  @override
  void mount(Element parent, newSlot) {
    print("$TAG: $name Element mount");
    super.mount(parent, newSlot);
  }

  @override
  void update(StatelessWidget newWidget) {
    print("$TAG: $name Element update");
    super.update(newWidget);
  }

  @override
  Element updateChild(Element child, Widget newWidget, newSlot) {
    print("$TAG: $name updateChild child:$child, newWidget:$newWidget");
    return super.updateChild(child, newWidget, newSlot);
  }

  @override
  void performRebuild() {
    super.performRebuild();
    print("$TAG: $name set child value");
  }
}


////////--------------


class A extends StatelessWidget {

  A() {
    print("A contstror");
  }

  @override
  StatelessElement createElement() {
    print("A createElement");
    return TestStatelessElement(this, "A");
  }

  @override
  Widget build(BuildContext context) {

    Text("");
    CustomPaint();

    return Column(
      children: <Widget>[
        B(),
        B(),
        B(),
      ],
    );

    // MultiChildRenderObjectElement e;
    // Row r;
    // return B();
  }
}

class MyColumn extends Column {

  @override
  MultiChildRenderObjectElement createElement() {
    return super.createElement();
  }
}

class MyMutiChildElement extends MultiChildRenderObjectElement {
  MyMutiChildElement(MultiChildRenderObjectWidget widget) : super(widget);

  @override
  void mount(Element parent, newSlot) {
    super.mount(parent, newSlot);
  }
}


class B extends StatelessWidget {


  B() {
    print("B construtor");
  }

  @override
  StatelessElement createElement() {
    print("B createElement");
    return TestStatelessElement(this, "B");
  }

  @override
  Widget build(BuildContext context) {
    return C();
  }
}



class C extends StatelessWidget {

  C() {
    print("C construtor");
  }

  @override
  StatelessElement createElement() {
    return TestStatelessElement(this,"C");
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogo(
      size: 100,
    );
  }

}