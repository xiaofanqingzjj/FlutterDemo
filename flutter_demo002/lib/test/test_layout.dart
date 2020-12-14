import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Test Layout"),
        ),
        body: Container(
            child: Container(
                color: Colors.blue,
                child: Container(
                  // color: Colors.red,
                  child: Column(
                    children: [
                      // Container(
                      //   color: Colors.red,
                      // ),
                      Text("aaadafsd"),
                      Center(),
                      Spacer(),

                      LimitedBox(
                        maxWidth: 0,
                        maxHeight: 5,
                        child: Text("helo world"),
                      )
                      // Center(),
                    ],
                  ),
                ))));
  }
}
