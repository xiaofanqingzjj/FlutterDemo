



import 'dart:async';

void main() {
  print("hello");


  MyFuture(() {
    return 1 + 1;
  }).then((value) {
    print("value:$value");
  });
}


class TestFuture {



}


/// 自己实现一个Future
///



abstract class MyFuture<T> {


  factory MyFuture(T task()) {
    MyFutureImpl<T> futureImpl = MyFutureImpl();
    Timer.run(() {
      final r = task();
      futureImpl.complete(r);
    });

    return futureImpl;
  }


  void complete(T value) ;

  void then(void Function(T value) onValue);
}

class MyFutureImpl<T> implements MyFuture<T> {

  MyFutureImpl() {

  }


  List<Function> callbacks = [];

  void complete(T value) {
    callbacks.forEach((element) {
      element(value);
    });
  }

  void then(void Function(T value) onValue) {
    callbacks.add(onValue);
  }
}