import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
/*
 * 了解组件的生命周期函数
 */
class LifeCycleWidget extends StatefulWidget {
  @override
  _LifeCycleWidgetState createState() {
    print("createState >>>>>");
    return _LifeCycleWidgetState();
  }
}

class _LifeCycleWidgetState extends State<LifeCycleWidget> {
   int _count=0;

  _pressLogic(){
    setState(() {
      _count++;
    });
  }

  @mustCallSuper
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("initState >>>>>>");
  }



  @override
  void didUpdateWidget(LifeCycleWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget >>>>>>");

  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("didChangeDependencies >>>>>>");

  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("deactivate >>>>>>");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("dispose >>>>>>");
  }
  @override
  Widget build(BuildContext context) {
    print("build >>>>>>");

    return Scaffold(
      appBar:AppBar(
        title: Text("生命周期"),
      ) ,
      body: Container(
        alignment: Alignment.center,
        child: SizedBox(
          child: RaisedButton(onPressed: _pressLogic,
            child: Text("点击了$_count"),
          ),
        ),
      ),
    );
  }


}
