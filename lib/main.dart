import 'package:flutter/material.dart';
import 'RandomWords.dart';

void main() => runApp(new MyAppStateWidget());

class MyAppStateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Welcome to Flutter from app'),
            ),
            body: Center(
              child: new RandomWordsWidget(),
            )));
  }
}
