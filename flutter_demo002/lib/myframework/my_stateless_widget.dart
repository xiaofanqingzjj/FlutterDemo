


import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';


///
/// 模拟了下StatelessWidget的执行过程
///
///



abstract class MyComponentElement extends Element {

  // We let widget authors call setState from initState, didUpdateWidget, and
  // build even when state is locked because its convenient and a no-op anyway.
  // This flag ensures that this convenience is only allowed on the element
  // currently undergoing initState, didUpdateWidget, or build.
  bool _debugAllowIgnoredCallsToMarkNeedsBuild = false;
  bool _debugSetAllowIgnoredCallsToMarkNeedsBuild(bool value) {
    assert(_debugAllowIgnoredCallsToMarkNeedsBuild == !value);
    _debugAllowIgnoredCallsToMarkNeedsBuild = value;
    return true;
  }

  /// Creates an element that uses the given widget as its configuration.
  MyComponentElement(Widget widget) : super(widget);

  Element _child;

  @override
  void mount(Element parent, dynamic newSlot) {
    super.mount(parent, newSlot);

    print("MyComponent mount child");

    assert(_child == null);
//    assert(_active);
    _firstBuild();
    assert(_child != null);
  }

  void _firstBuild() {
    print("MyCompount _firstBuild");
    rebuild();

  }

  @override
  void rebuild() {
    print("rebuild");
    super.rebuild();
  }

  /// Calls the [StatelessWidget.build] method of the [StatelessWidget] object
  /// (for stateless widgets) or the [State.build] method of the [State] object
  /// (for stateful widgets) and then updates the widget tree.
  ///
  /// Called automatically during [mount] to generate the first build, and by
  /// [rebuild] when the element needs updating.
  @override
  void performRebuild() {
    print("performRebuild");

    if (!kReleaseMode && debugProfileBuildsEnabled)
      ;
      // Timeline.startSync('${widget.runtimeType}',  arguments: timelineWhitelistArguments);

    assert(_debugSetAllowIgnoredCallsToMarkNeedsBuild(true));
    Widget built;
    try {
      built = build();
      debugWidgetBuilderValue(widget, built);
    } catch (e, stack) {
      built = ErrorWidget.builder(
        _debugReportException(
          ErrorDescription('building $this'),
          e,
          stack,
          informationCollector: () sync* {
            yield DiagnosticsDebugCreator(DebugCreator(this));
          },
        ),
      );
    } finally {
      // We delay marking the element as clean until after calling build() so
      // that attempts to markNeedsBuild() during build() will be ignored.
//      _dirty = false;
//       dirt = false;
      assert(_debugSetAllowIgnoredCallsToMarkNeedsBuild(false));
    }
    try {
      _child = updateChild(_child, built, slot);
      assert(_child != null);
    } catch (e, stack) {
      built = ErrorWidget.builder(
        _debugReportException(
          ErrorDescription('building $this'),
          e,
          stack,
          informationCollector: () sync* {
            yield DiagnosticsDebugCreator(DebugCreator(this));
          },
        ),
      );
      _child = updateChild(null, built, slot);
    }

    if (!kReleaseMode && debugProfileBuildsEnabled)
      Timeline.finishSync();
  }

  /// Subclasses should override this function to actually call the appropriate
  /// `build` function (e.g., [StatelessWidget.build] or [State.build]) for
  /// their widget.
  @protected
  Widget build();

  @override
  void visitChildren(ElementVisitor visitor) {
    if (_child != null)
      visitor(_child);
  }

  @override
  void forgetChild(Element child) {
    assert(child == _child);
    _child = null;
  }
}


class MyStatelessElement extends MyComponentElement {
  MyStatelessElement(MyStatelessWidget widget) : super(widget);

  @override
  MyStatelessWidget get widget => super.widget;

  @override
  Widget build() {
    print("state element build");
    return widget.build(this);
  }

  @override
  void update(StatelessWidget newWidget) {
    super.update(newWidget);
    assert(widget == newWidget);
    // dirt = true;
    rebuild();
  }

  @override
  bool get debugDoingBuild => throw UnimplementedError();
}


///
/// 一个自定义的StatelessWidget
///
abstract class MyStatelessWidget extends Widget {
  const MyStatelessWidget({ Key key }) : super(key: key);

  @override
  MyStatelessElement createElement() {
    print("createElement");
    return MyStatelessElement(this);
  }

  @protected
  Widget build(BuildContext context) ;
}


/// A wrapper class for the [Element] that is the creator of a [RenderObject].
///
/// Attaching a [DebugCreator] attach the [RenderObject] will lead to better error
/// message.
class DebugCreator {
  /// Create a [DebugCreator] instance with input [Element].
  DebugCreator(this.element);

  /// The creator of the [RenderObject].
  final Element element;

  @override
  String toString() => element.debugGetCreatorChain(12);
}

FlutterErrorDetails _debugReportException(
    DiagnosticsNode context,
    dynamic exception,
    StackTrace stack, {
      InformationCollector informationCollector,
    }) {
  final FlutterErrorDetails details = FlutterErrorDetails(
    exception: exception,
    stack: stack,
    library: 'widgets library',
    context: context,
    informationCollector: informationCollector,
  );
  FlutterError.reportError(details);
  return details;
}
