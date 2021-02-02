


/// 手动生成一个迭代器
///




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

void main() {
  print("hello");

  List l;

  // final iterable = naturalsTo(10);
  final iterable = Iterable.generate(20, (index) {
    print("generator:$index");
    return index * 2;
  });

  print("iterable:${iterable.runtimeType}");


  final it = iterable.iterator;
  for (;it.moveNext();){
    final value = it.current;
    print("value:$value");
  }
}