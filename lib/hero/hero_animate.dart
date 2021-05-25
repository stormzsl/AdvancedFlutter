import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class _PhotoHero extends StatelessWidget {
  final VoidCallback onTab;

  final double width;

  final String photo;
  const _PhotoHero({Key key, this.onTab, this.width, this.photo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTab,
            child: Hero(
                tag: photo,
                child: Image.asset(
                  photo,
                  fit: BoxFit.cover,
                )),
          ),
        ));
  }
}

class HeroAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Basic Hero Animation"),
      ),
      body: Center(
        child: _PhotoHero(
          width: 300.0,
          photo: "images/flippers-alpha.png",
          onTab: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext context) {
              return Scaffold(
                appBar: AppBar(
                  title: Text("Flippers Page"),
                ),
                body: Container(
                  color: Colors.lightBlueAccent,
                  alignment: Alignment.topLeft,
                  child: _PhotoHero(
                    width: 100,
                    photo: "images/flippers-alpha.png",
                    onTab: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              );
            }));
          },
        ),
      ),
    );
  }
}

class BasicHeroAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("basic hero animation"),
      ),
      body: InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return Scaffold(
              appBar: AppBar(
                title: Text("flippers page"),
              ),
              body: InkWell(
                child: SizedBox(
                  height: 100,
                  child: Hero(
                    tag: "flippers",
                    child: Image.asset("images/flippers-alpha.png"),
                  ),
                ),
                onTap: () => Navigator.of(context).pop(),
              ),
            );
          }));
        },
        child: SizedBox(
          height: 300,
          child: Hero(
              tag: "flippers", child: Image.asset("images/flippers-alpha.png")),
        ),
      ),
    );
  }
}

class StaggedAnimation extends StatelessWidget {
  StaggedAnimation({Key key, this.controller})
      : opacity = Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.0,
              0.100,
              curve: Curves.ease,
            ),
          ),
        ),
        width = Tween<double>(begin: 50.0, end: 150.0).animate(CurvedAnimation(
            parent: controller,
            curve: Interval(0.125, 0.250, curve: Curves.ease))),
        height = Tween<double>(begin: 50, end: 150).animate(CurvedAnimation(
            parent: controller,
            curve: Interval(0.25, 0.375, curve: Curves.ease))),
        padding = EdgeInsetsTween(
                begin: EdgeInsets.only(bottom: 16),
                end: EdgeInsets.only(bottom: 75))
            .animate(CurvedAnimation(
                parent: controller,
                curve: Interval(0.25, 0.375, curve: Curves.ease))),
        borderRadius = BorderRadiusTween(
                begin: BorderRadius.all(Radius.circular(4)),
                end: BorderRadius.all(Radius.circular(75)))
            .animate(CurvedAnimation(
                parent: controller, curve: Interval(0.375, 0.5))),
        color = ColorTween(
                begin: Colors.indigo[100], end: Colors.lightBlueAccent[400])
            .animate(CurvedAnimation(
                parent: controller, curve: Interval(0.5, 0.75))),
        super(key: key);
  final AnimationController controller;
  final Animation<double> opacity;
  final Animation<double> width;
  final Animation<double> height;
  final Animation<EdgeInsets> padding;
  final Animation<BorderRadius> borderRadius;
  final Animation<Color> color;

  Widget _buildAnimation(BuildContext context, Widget child){
    return Container(
      padding: padding.value,
      alignment: Alignment.bottomCenter,
      child: Opacity(opacity: opacity.value,
        child: Container(
          width: width.value,
          height: height.value,
          decoration: BoxDecoration(color: color.value,
              border: Border.all(width: 3,color: Colors.indigo[100]),
              borderRadius: borderRadius.value),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
   return AnimatedBuilder(
     builder: _buildAnimation,
      animation: controller,
   );
  }
}

class StaggerDemo extends StatefulWidget{
  @override
  _StaggerDemoState createState() => _StaggerDemoState();
}

class _StaggerDemoState extends State<StaggerDemo> with TickerProviderStateMixin{
  AnimationController _controller;
  @override
  void initState() {
    _controller=AnimationController(duration:const Duration(seconds: 2000),vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    timeDilation=10.0;
    return Scaffold(
      appBar: AppBar(
        title: Text("Staggered Animation"),
      ),
      body: GestureDetector(
        onTap: _playAnimation,
        child: Center(
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.1),border: Border.all(color: Colors.black.withOpacity(0.5),width: 3)),
            child: StaggedAnimation(controller: _controller.view),
          ) ,
        )

      )

    );
  }




  Future<void> _playAnimation() async {
    try{
     await _controller.forward().orCancel;
     await _controller.reverse().orCancel;
    } on TickerCanceled{
// the animation got canceled, probably because we were disposed
    }
  }
}
