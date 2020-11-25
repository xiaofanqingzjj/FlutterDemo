



import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_demo001/protobuf/dart/proto/test.pb.dart';

void main() {
  print("hello world");

  final eddm = EmbeddedMessage();
  eddm.stringVal = "hell";
  eddm.int32Val = 222;

  Example1 example1 = Example1();
  example1.stringVal = "StringValue";
  example1.bytesVal = utf8.encode("你是一个好忍吗");
  example1.embeddedExample1 = eddm;


  Uint8List bytes = example1.writeToBuffer();


  final r = Example1.fromBuffer(bytes);

  print("result:$r");

}


/// 字符串和字节流的互转
void testStrToBytes() {
  List<int> bytes = utf8.encode("Hello world");
  print("bytes:$bytes");
  String r = utf8.decode(bytes);
  print("result:$r");

}