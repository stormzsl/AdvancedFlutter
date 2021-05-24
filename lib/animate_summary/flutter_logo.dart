import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogoWidget extends StatefulWidget {
  @override
  _LogoWidgetState createState() => _LogoWidgetState();
}

class _LogoWidgetState extends State<LogoWidget>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController animationController;

  @override
  void initState() {
    animationController =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    animation = Tween<double>(begin: 0, end: 300).animate(animationController)
      ..addStatusListener((status) {
        //用来监听动画状态，比如开始，结束,方向改变
        debugPrint(">>>>> $status");
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          animationController.forward();
        }
      })
      ..addListener(() {
        setState(() {
          //重新构建
        });
      });
    animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: animation.value,
      width: animation.value,
      child: FlutterLogo(),
    ));
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
