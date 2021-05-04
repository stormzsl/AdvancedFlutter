import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyAppStateWidget());

class MyAppStateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var wordPair = new WordPair.random();
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Welcome to Flutter from app'),
            ),
            body: Center(
              child: Text(wordPair.asCamelCase),
            )));
  }
}
