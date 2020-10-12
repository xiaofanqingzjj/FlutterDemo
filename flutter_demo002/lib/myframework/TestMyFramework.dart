



import 'package:flutter/material.dart';
import 'package:flutter_demo001/myframework/myframework.dart';

class TestMyFramework extends MyStatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("aaa"),
      ),
      body: Center(
        child: FlutterLogo(),
      ),
    );
  }

}