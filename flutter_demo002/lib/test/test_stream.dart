



void main() async{
  print("hello world");

  Stream<int> stream = Stream.value(1);

  var value = await sumStream(stream);
  print("value: $value");
}

Future<int> sumStream(Stream<int> stream) async {
  var sum = 0;
  await for(var value in stream) {
    sum += value;
  }
  return sum;
}