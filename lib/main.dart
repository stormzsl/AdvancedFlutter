import 'package:flutter/material.dart';
import 'layout/LayoutPractice.dart';

void main() => runApp(new MyAppStateWidget());

class MyAppStateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '英语生成列表主标题',
      theme: ThemeData(primaryColor: Colors.white), //更改页面主题
      home: LayoutWidget(),
    );
  }
}
