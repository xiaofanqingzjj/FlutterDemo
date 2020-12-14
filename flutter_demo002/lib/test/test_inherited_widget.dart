import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestInheritedWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TestInheritedWidgetState();
  }

}


class TestInheritedWidgetState extends State<TestInheritedWidget> {

  int count = 0;

  @override
  Widget build(BuildContext context) {
    // context.inheritFromWidgetOfExactType(targetType)

    // context.dependOnInheritedWidgetOfExactType()
    return Scaffold(
      body:  Center(
        child: ShareDataWidget( //使用ShareDataWidget
          data: count,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: _TestWidget(),//子widget中依赖ShareDataWidget
              ),
              RaisedButton(
                child: Text("Increment"),
                //每点击一次，将count自增，然后重新build,ShareDataWidget的data将被更新
                onPressed: () => setState(() => ++count),
              )
            ],
          ),
        ),
      ),
    ) ;

  }

}

class ShareDataWidget extends InheritedWidget {

  final int data;

  ShareDataWidget({this.data, Widget child}) : super(child: child);

  @override
  bool updateShouldNotify(covariant ShareDataWidget oldWidget) {
    return oldWidget.data != data;
  }


  //定义一个便捷方法，方便子树中的widget获取共享数据
  static ShareDataWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ShareDataWidget>();
  }
}

class _TestWidget extends StatefulWidget {
  @override
  __TestWidgetState createState() => new __TestWidgetState();
}

class __TestWidgetState extends State<_TestWidget> {
  @override
  Widget build(BuildContext context) {
    //使用InheritedWidget中的共享数据
    return Text(ShareDataWidget
        .of(context)
        .data
        .toString());
  }

  @override
  void didUpdateWidget(covariant _TestWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    // ValueNotifier
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    //如果build中没有依赖InheritedWidget，则此回调不会被调用。
    print("Dependencies change");
  }
}

