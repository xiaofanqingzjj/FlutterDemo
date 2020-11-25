///
//  Generated code. Do not modify.
//  source: proto/test.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class EmbeddedMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'EmbeddedMessage', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'int32Val', $pb.PbFieldType.O3, protoName: 'int32Val')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'stringVal', protoName: 'stringVal')
    ..hasRequiredFields = false
  ;

  EmbeddedMessage._() : super();
  factory EmbeddedMessage() => create();
  factory EmbeddedMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EmbeddedMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EmbeddedMessage clone() => EmbeddedMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EmbeddedMessage copyWith(void Function(EmbeddedMessage) updates) => super.copyWith((message) => updates(message as EmbeddedMessage)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EmbeddedMessage create() => EmbeddedMessage._();
  EmbeddedMessage createEmptyInstance() => create();
  static $pb.PbList<EmbeddedMessage> createRepeated() => $pb.PbList<EmbeddedMessage>();
  @$core.pragma('dart2js:noInline')
  static EmbeddedMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EmbeddedMessage>(create);
  static EmbeddedMessage _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get int32Val => $_getIZ(0);
  @$pb.TagNumber(1)
  set int32Val($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasInt32Val() => $_has(0);
  @$pb.TagNumber(1)
  void clearInt32Val() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get stringVal => $_getSZ(1);
  @$pb.TagNumber(2)
  set stringVal($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasStringVal() => $_has(1);
  @$pb.TagNumber(2)
  void clearStringVal() => clearField(2);
}

class Example1 extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Example1', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'stringVal', protoName: 'stringVal')
    ..a<$core.List<$core.int>>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bytesVal', $pb.PbFieldType.OY, protoName: 'bytesVal')
    ..aOM<EmbeddedMessage>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'embeddedExample1', protoName: 'embeddedExample1', subBuilder: EmbeddedMessage.create)
    ..p<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'repeatedInt32Val', $pb.PbFieldType.P3, protoName: 'repeatedInt32Val')
    ..pPS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'repeatedStringVal', protoName: 'repeatedStringVal')
    ..hasRequiredFields = false
  ;

  Example1._() : super();
  factory Example1() => create();
  factory Example1.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Example1.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Example1 clone() => Example1()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Example1 copyWith(void Function(Example1) updates) => super.copyWith((message) => updates(message as Example1)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Example1 create() => Example1._();
  Example1 createEmptyInstance() => create();
  static $pb.PbList<Example1> createRepeated() => $pb.PbList<Example1>();
  @$core.pragma('dart2js:noInline')
  static Example1 getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Example1>(create);
  static Example1 _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get stringVal => $_getSZ(0);
  @$pb.TagNumber(1)
  set stringVal($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStringVal() => $_has(0);
  @$pb.TagNumber(1)
  void clearStringVal() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get bytesVal => $_getN(1);
  @$pb.TagNumber(2)
  set bytesVal($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBytesVal() => $_has(1);
  @$pb.TagNumber(2)
  void clearBytesVal() => clearField(2);

  @$pb.TagNumber(3)
  EmbeddedMessage get embeddedExample1 => $_getN(2);
  @$pb.TagNumber(3)
  set embeddedExample1(EmbeddedMessage v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasEmbeddedExample1() => $_has(2);
  @$pb.TagNumber(3)
  void clearEmbeddedExample1() => clearField(3);
  @$pb.TagNumber(3)
  EmbeddedMessage ensureEmbeddedExample1() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.List<$core.int> get repeatedInt32Val => $_getList(3);

  @$pb.TagNumber(5)
  $core.List<$core.String> get repeatedStringVal => $_getList(4);
}

