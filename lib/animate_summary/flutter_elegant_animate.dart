import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class _LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: FlutterLogo(),
    );
}


class _GrowTransition extends StatelessWidget {

  final Widget child;
  final Animation<double> animation;

  const _GrowTransition({Key key,@required this.child,@required this.animation}):assert(child!=null),assert(animation!=null),super(key:key);

  @override
  Widget build(BuildContext context) {
    debugPrint("***** _GrowTransition build ${animation.value}");
    return Center(
       child:AnimatedBuilder(
           animation: animation,
           builder: (context, child) => Container(
             height: animation.value,
             width: animation.value,
             child: child,
           ),
           child: child),
    );
  }
}

class ElegantWidget extends StatefulWidget {

  @override
  _ElegantWidgetState createState() => _ElegantWidgetState();
}

class _ElegantWidgetState extends State<ElegantWidget> with SingleTickerProviderStateMixin{

  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    controller=AnimationController(duration: const Duration(seconds: 3),vsync: this);
    animation=Tween<double>(begin: 0,end: 300).animate(controller)..addListener(() {
      setState(() {
        debugPrint(">>> ${animation.value}");
      });

    })..addStatusListener((status) {

    });
    controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => _GrowTransition(child: _LogoWidget(), animation: animation);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

