import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _randomWordsPair = <WordPair>[];
  final _savedWordPairs = Set<WordPair>();

  Widget _buildList() {
    return ListView.builder(
      padding: const EdgeInsets.all(17.0),
      itemBuilder: (context, item) {
        if (item.isOdd) return Divider();

        final index = item ~/ 2;

        if (index >= _randomWordsPair.length) {
          _randomWordsPair.addAll(generateWordPairs().take(10));
        }

        return _builderRow(_randomWordsPair[index]);
      },
    );
  }

  Widget _builderRow(WordPair pair) {
    final alreadySaved = _savedWordPairs.contains(pair);
    return ListTile(
        title: Text(pair.asPascalCase, style: TextStyle(fontSize: 18.0)),
        trailing: Icon(alreadySaved ? Icons.favorite : Icons.favorite_border,
            color: alreadySaved ? Colors.yellow : null),
        onTap: () {
          setState(() {
            if (alreadySaved) {
              _savedWordPairs.remove(pair);
            } else {
              _savedWordPairs.add(pair);
            }
          });
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('WordPair Text Generator')),
        body: _buildList());
  }
}
