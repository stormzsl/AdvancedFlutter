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
  var words = WordPair.random().asPascalCase;
  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        new Text(words),
        new TextButton(
          onPressed: () {
            LogUtil.v('onPressed >>>>');
            setState(() {
              words = WordPair.random().asCamelCase;
            });
          },
          child: Text('TextButton click'),
        )
      ],
    );
  }
}
