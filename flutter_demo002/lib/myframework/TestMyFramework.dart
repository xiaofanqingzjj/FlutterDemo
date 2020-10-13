



import 'package:flutter/material.dart';
import 'package:flutter_demo001/myframework/my_stateless_widget.dart';

class TestMyFramework extends MyStatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Widget build");
    return Scaffold(
      appBar: AppBar(
        title: Text("aaa"),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: FlutterLogo(),
          ),
          Text("Call")
        ],
      )
     
    );
  }

}