import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'dart:developer';


// this is where we create our custom widgets
// We create a RandomWords class which overrrides the create state
// which is why we extends the StatefullWidget

class RandomWords extends StatefulWidget {
  @override 
  RandomWordsState createState() => RandomWordsState();
}

// this is where we handle our UI stuff
class RandomWordsState extends State<RandomWords> {

  //  we want to iterate through this list/array  
  // we are using the english words package and it's an array of WordPair type
 
  final _randomWordPairs = <WordPair>[]; 
  final _savedWordPairs = Set<WordPair>(); // this is basically a list with unique objects

  Widget _buildList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, item) { // this is essentially a map
        if (item.isOdd) return Divider(); 

        final index = item ~/ 2;// lists the number of items in the listview minus the diver widgets

        if (index >= _randomWordPairs.length) {
          _randomWordPairs.addAll(generateWordPairs().take(10));
        }
 
        return _buildRow(_randomWordPairs[index]);
      },
    );
  }

  // we create this new widget which takes in a WordPair
  Widget _buildRow(WordPair pair) {
    final alreadySaved = _savedWordPairs.contains(pair); // this will conditionally render our favorite icon

    return ListTile(
      title: Text(pair.asPascalCase,
          style: TextStyle(fontSize: 18.0)
        ),
      trailing: Icon(alreadySaved ? Icons.favorite : 
        Icons.favorite_border, color: alreadySaved ? Colors.red : null), // this enables use to have an icon on the right side of the word
      onTap: () { // this is basically runs a function when tapped
        setState(() { 
          if (alreadySaved) {
            _savedWordPairs.remove(pair);
            //debugPrint('data: $_randomWordPairs');

          } else {
            _savedWordPairs.add(pair);
            //log('data: $_savedWordPairs');

          }
        });
      }
    ); // this is one of the rows in the list view
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = 
            _savedWordPairs.map((WordPair pair) {
              return ListTile(
                title: Text(pair.asPascalCase,
                  style: TextStyle(fontSize: 16.0))
              );
            });

            final List<Widget> divided = ListTile.divideTiles(
                context: context, // this context is from the builder
                tiles: tiles
            ).toList();

            return Scaffold(
              appBar: AppBar(
                title: Text('Saved WordPairs')
              ),
              body: ListView(children: divided)
            );
        }
      )
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WordPair Generator'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved)
        ]),
      body: _buildList()
    );
  }
}

// the home page is the bottom route of the stack