




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


///
/// 一个带标题的页面
///
// ignore: must_be_immutable
abstract class Page extends StatelessWidget {

  String _title;

  Widget _content;

  set title(String value) {
    _title = value;
  }

  set content(Widget widget) {
    _content = widget;
  }

  @override
  Widget build(BuildContext context) {

    var t = _title;
    return Scaffold(
      appBar: AppBar(
        title: Text(t != null ? t :""),
      ),
      body: _content,
    );
  }

}