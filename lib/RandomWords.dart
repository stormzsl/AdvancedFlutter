import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomWordsWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new RandomWordsState();
  }
}

class RandomWordsState extends State<RandomWordsWidget> {
  @override
  Widget build(BuildContext context) {
    final words = WordPair.random();
    return new Text(words.asCamelCase);
  }
}
