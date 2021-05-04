import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'utils/CommonUtils.dart';

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
    return new Column(
      children: [
        new Text(words.asCamelCase),
        new TextButton(
          onPressed: () {
            LogUtil.v('onPressed >>>>');
          },
          child: Text('TextButton click'),
        )
      ],
    );
  }
}
