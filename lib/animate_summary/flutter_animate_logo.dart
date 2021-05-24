import 'dart:isolate';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
 * AnimatedWidget 基本类可以从动画代码中区分出核心 widget 代码。 AnimatedWidget 不需要保持 State 对象来 hold 动画。可以添加下面的 AnimatedLogo 类：
 */
class _AnimatedLogo extends AnimatedWidget {
  const _AnimatedLogo({Key key, @required Animation<double> animation})
      : assert(animation != null),
        super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    var animation = listenable as Animation<double>;
    return Center(
      child: Container(
        width: animation.value,
        height: animation.value,
        child: FlutterLogo(),
      ),
    );
  }
}

class AnimateLogoWidget extends StatefulWidget {
  _AnimateLogoWidgetState createState() => _AnimateLogoWidgetState();
}

// #docregion print-state
class _AnimateLogoWidgetState extends State<AnimateLogoWidget>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 0, end: 300).animate(controller)
      // #enddocregion print-state
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      })
      // #docregion print-state
      ..addStatusListener((state) => print('$state'));
    controller.forward();
  }
  // #enddocregion print-state

  @override
  Widget build(BuildContext context) => _AnimatedLogo(animation: animation);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
// #docregion print-state
}
