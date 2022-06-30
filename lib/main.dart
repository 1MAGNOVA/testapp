import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.yellow[900]),
        home: RandomWords());
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _randomWordsPair = <WordPair>[];

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
    return ListTile(
        title: Text(pair.asPascalCase, style: TextStyle(fontSize: 18.0)));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('WordPair Text Generator')),
        body: _buildList());
  }
}
