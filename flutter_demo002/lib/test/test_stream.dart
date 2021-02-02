

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

class Foo {
  int value;

  Foo(this.value);

  @override
  String toString() {
    return 'Foo{value: $value}';
  }


}


void main() async{
  // print("hello world");
  //
  // Future.delayed(Duration(seconds: 2)).then((value) {
  //   print('after delay1');
  // });
  //
  // print("after delay2");
  //
  // await Future.delayed(Duration(seconds: 2));
  //
  // print("after Delay3");
  //
  // Stream<int> stream = Stream.value(1);
  //
  // int start = DateTime.now().millisecond;
  // final list = [Foo(1), Foo(2), Foo(3), Foo(4), Foo(5), Foo(6), ];
  //
  // // Stream.fromIterable(list).listen((event) async {
  // //   await Future.delayed(Duration(seconds: 1));
  // //   event.value ++;
  // //   print("value:${event.value}");
  // // }).asFuture();
  // //
  // // await for (var value in Stream.fromIterable(list)) {
  // //   await Future.delayed(Duration(seconds: 1));
  // //   value.value ++;
  // //   print(value);
  // // }
  // //
  // // await Stream.fromIterable(list).asyncMap((event) async {
  // //     await Future.delayed(Duration(seconds: 1));
  // //     event.value ++;
  // // }).length;
  // //
  //
  // // //
  // //  Stream.fromFutures(list.map((e) async {
  // //   int delayTime = Random().nextInt(4);
  // //   await Future.delayed(Duration(seconds: delayTime));
  // //   e.value ++;
  // //   return e.value;
  // // })).transform(streamTransformer)
  // //
  //
  //
  //
  //
  // await Stream.fromIterable(list).asyncExpand((event) {
  //   return Stream.fromFuture(Future.delayed(Duration(seconds: 1), () {
  //     event.value ++;
  //   }));
  // }).forEach((element) {
  //   print("element:$element");
  // });
  //
  // int time = DateTime.now().millisecond - start;
  // print("finish:$list, time:$time");


  // testFiles();

  StreamController controller = StreamController();
  controller.sink.add(2);
  controller.add(1);
  controller.add(1);
  controller.add(1);

  controller.sink.addStream(Stream.periodic(Duration(seconds: 1), (count)=>count).take(10));
  
  // controller.stream.

  controller.stream.forEach((element) {
    print("element:$element");
  });
}

Future testFiles() async{

  var file = File("test_render_box.dart");

  // String content = await  file.readAsString();
  // print("fileContent:$content");

  final stream = file.openRead();

  // 如何把stream转成String?
  utf8.decoder.bind(stream);


}

Future<void> testTransform(List<String> args) async {
  var file = File(args[0]);
  var lines = utf8.decoder
      .bind(file.openRead())
      .transform(LineSplitter());
  await for (var line in lines) {
    if (!line.startsWith('#')) print(line);
  }
}

Stream<int> countStream(int to) async* {
  for (int i = 1; i <= to; i++) {
    yield i;
  }
}

Future<int> sumStream(Stream<int> stream) async {
  var sum = 0;

  // stream.listen((event) {
  //
  // });
  await for(var value in stream) {
    sum += value;
  }
  return sum;
}




///
/// 同步迭代生成器
///
Iterable naturalsTo(n) sync* {
  int k = 0;
  while (k < n){
    print("while k:$k");
    yield k++;
  }
}

testSync() sync*{
  // return "";

}