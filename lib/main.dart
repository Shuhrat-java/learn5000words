import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:english_words/src/words/adjectives.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black
        ),
      ),
        title: "Testing",
        home: const RandomWords());
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _savedWords = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 20);

  void _pushSaved() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_context) {
      final tiles = _savedWords.map((pair) {
        return ListTile(
            title: Text(
          pair.asPascalCase,
          style: _biggerFont,
        ));
      });

      final _divides = tiles.isNotEmpty
          ? ListTile.divideTiles(
              context: _context,
              tiles: tiles,
            ).toList()
          : <Widget>[];

      return Scaffold(
          appBar: AppBar(title: Text("Saved word pairs")),
          body: ListView(children: _divides));
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Flutter app"),
          actions: [
            IconButton(
              onPressed: _pushSaved,
              icon: const Icon(Icons.list),
              tooltip: "Saved words",
            )
          ],
        ),
        body: _generateWords());
  }

  Widget _generateWords() {
    return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemBuilder: (BuildContext context, int i) {
          if (i.isOdd) {
            return const Divider();
          }

          final index = i ~/ 2;
          if (_suggestions.length == index) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair wordPair) {
    final _alreadySaved = _savedWords.contains(wordPair);
    return ListTile(
      title: Text(
        wordPair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        _alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: _alreadySaved ? Colors.red : null,
        semanticLabel: _alreadySaved ? "Already saved" : "Save",
      ),
      onTap: () {
        setState(() {
          if (_alreadySaved) {
            _savedWords.remove(wordPair);
          } else {
            _savedWords.add(wordPair);
          }
        });
      },
    );
  }
}
