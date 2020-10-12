import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo001/mywidgets/loadmore.dart';

///
/// 代表一个页面，有点类似android的Activity
///
class PageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: buildContent(context),
    );
  }

  ///
  ///
  ///
  Widget buildContent(BuildContext context) {
    return MyHomePage(title: "TEST",);
  }
}

///
///
/// 这是一个列表例子
///

class TestListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TestListViewState();
  }
}

class _TestListViewState extends State<TestListView> {

  bool isLoading = false;

  bool hasMore = true;

  List<String> data = ["a", "b", "c", "d"];


  List<String> _testData() {
    List list = [];
     for (int i= 0; i<10; i++) {
       list.add("item$i");
     }
     return list;
  }


  @override
  void initState() {
    super.initState();
  }

  void _loadData() {





  }

  Widget _buildLoadMorePanel() {
    return Container(
      child: Text("Loading..."),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return (index == data.length)
            ? _buildLoadMorePanel()
            : ListTile(
                title: Text(data[index]),
              );
      },
      itemCount: hasMore ? data.length + 1 : data.length,
    );
  }
}



class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int get count => list.length;

  List<int> list = [];

  void initState() {
    super.initState();
    // list.addAll(List.generate(30, (v) => v));


  }

  void load() {
    print("load");
    setState(() {
      list.addAll(List.generate(15, (v) => v));
      print("data count = ${list.length}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return  RefreshIndicator(
          child: LoadMore(
            isFinish: count >= 60,
            onLoadMore: _loadMore,

            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text("${list[index]}"),
                );
              },
              itemCount: count,
            ),

            whenEmptyLoad: true,
            delegate: DefaultLoadMoreDelegate(),
            textBuilder: DefaultLoadMoreTextBuilder.chinese,
          ),


          onRefresh: _refresh,
        );
  }

  Future<bool> _loadMore() async {
    print("onLoadMore");
    await Future.delayed(Duration(seconds: 0, milliseconds: 2000));
    load();
    return true;
  }

  Future<void> _refresh() async {
    await Future.delayed(Duration(seconds: 0, milliseconds: 2000));
    list.clear();
    load();
  }
}
