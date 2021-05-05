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
  final _suggestions = <WordPair>[];
  final _bigFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('随机英语列表'),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(6),
        itemBuilder: (context, index) {
          if (index.isOdd) {
            return new Divider();
          }

          final i = index ~/ 2;
          if (i >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }

          return _buildRow(_suggestions[i]);
        });
  }

  Widget _buildRow(WordPair wordPair) {
    return ListTile(
      title: Text(
        wordPair.asCamelCase,
        style: _bigFont,
      ),
    );
  }
}
