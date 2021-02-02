import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


///
/// 测试共享
///
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
    return Scaffold(
      body: Center(
        child: ShareDataWidget(
          //使用ShareDataWidget
          data: count, // 共享数据

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: _TestWidget(), //子widget中依赖ShareDataWidget
              ),
              _TestWidget2(),
              RaisedButton(
                child: Text("Increment"),
                //每点击一次，将count自增，然后重新build,ShareDataWidget的data将被更新
                onPressed: (){
                  count ++;
                  // setState(() {
                  //
                  // });
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}

///
/// 一个可以给子Widget共享数据Widget
///
class ShareDataWidget extends InheritedWidget {
  final int data;

  ShareDataWidget({this.data, Widget child}) : super(child: child) {
    print("ShareDateWidget onCreate");
  }

  ///
  /// 当Widget被重建时候，是否通知依赖
  ///
  @override
  bool updateShouldNotify(covariant ShareDataWidget oldWidget) {
    // return false;
    return oldWidget.data != data;
  }

  ///定义一个便捷方法，方便子树中的widget获取共享数据
  static ShareDataWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ShareDataWidget>();
  }
}



/// 一个使用InheritedWidget共享数据的子Widget
class _TestWidget extends StatefulWidget {
  @override
  State createState() => new __TestWidgetState();
}

class __TestWidgetState extends State<_TestWidget> {

  String shareData;

  @override
  void initState() {
    super.initState();

    // shareData = ShareDataWidget.of(context).data.toString();
    // super.initState();


  }

  @override
  Widget build(BuildContext context) {
    // 获取共享数据
    final shareData = ShareDataWidget.of(context).data.toString();
    return Text(shareData);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    //如果build中没有依赖InheritedWidget，则此回调不会被调用。
    print("__TestWidgetState Dependencies change");
  }
}

/// 一个使用InheritedWidget共享数据的子Widget
class _TestWidget2 extends StatefulWidget {
  @override
  State createState() => new __TestWidgetState2();
}

class __TestWidgetState2 extends State<_TestWidget2> {
  @override
  Widget build(BuildContext context) {
    // 获取共享数据
    // final shareData = ShareDataWidget.of(context).data.toString();
    return Text("Test2");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    //如果build中没有依赖InheritedWidget，则此回调不会被调用。
    print("__TestWidgetState2 Dependencies change");
  }
}
