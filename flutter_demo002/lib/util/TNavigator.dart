



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TNavigator {

  static push(BuildContext context, Widget widget) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }
}