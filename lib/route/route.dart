import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

///更多详情：https://book.flutterchina.club/chapter2/flutter_router.html#_2-2-5-%E5%91%BD%E5%90%8D%E8%B7%AF%E7%94%B1
class _RouteNextWidget extends StatelessWidget {
  final String msg;
  const _RouteNextWidget({this.msg});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("这是跳转的页面"),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("收到上个页面的信息:$msg"),
              RaisedButton(
                onPressed: () {
                  Navigator.pop(context, "来自RouteNextWidget的信息");
                },
                child: Text("返回"),
              )
            ],
          ),
        ));
  }
}

class RouteWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "测试路由跳转",
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        body: Container(
          color: Colors.yellow.withOpacity(0.3),
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () async {
                  var result = await Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return _RouteNextWidget(
                      msg: "hello",
                    );
                  }));
                  print("收到来自上一个页面的数据 $result");
                },
                child: Text("跳转"),
              ),
            ],
          ),
        ));
  }
}
