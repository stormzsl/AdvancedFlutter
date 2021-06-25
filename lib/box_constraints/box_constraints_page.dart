import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'box_constraints.dart';

class BoxConstrainsPage extends StatelessWidget {
  const BoxConstrainsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("BoxConstrainsPage"),
          textTheme: Theme.of(context).textTheme,
        ),
        body: Column(
          children: <Widget>[
            NavBar(color: Colors.blue,title: '标题',),
            NavBar(color: Colors.white,title: '标题',),
          ],
        ),
      ),
    );
  }
}
