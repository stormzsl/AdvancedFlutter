import 'package:flutter/material.dart';
import 'roo_flutter.dart';

void main() => runApp(new MyAppStateWidget());

class MyAppStateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: '英语生成列表主标题',
        theme: ThemeData(primaryColor: Colors.red), //更改页面主题
        initialRoute: '/a',
        routes: <String, WidgetBuilder>{
          '/a': (BuildContext context) => new LayoutWidget(),
          '/b': (BuildContext context) => new RooButtonWidget(title: 'page B'),
          '/c': (BuildContext context) => new RooButtonWidget(title: 'page C')
        },
        home: new Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('flutter advance'),
          ),
          body: Center(
            child: RooButtonWidget(),
          ),
        ));
  }
}
