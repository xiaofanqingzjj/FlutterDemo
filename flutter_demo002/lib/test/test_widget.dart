



import 'package:flutter/cupertino.dart';


///
/// 比如说这个Widget的执行过程：
///
/// AElement.rebuild()
/// AElement.performElement()
/// AElement.build()
/// A.build() 调用Widget的build方法返回子Widget B
///
/// AElement.updateChild() 把返回值给AElement的child
///
/// AElement.inflateWidget()
///
/// 调用Widget B的createElement方法，返回BElement
///
///
///
///
///
///
///
///
///
///
///
///

class A extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return B();
  }

}

class B extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return C();
  }

}

class C extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("Hello world");
  }

}