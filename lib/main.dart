import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter App'))
      )
        // this is a widget of a Text property
        // Text(
        //   'Hello World',style: 
        //     TextStyle(
        //       fontSize: 30.5,
        //       color: Colors.green[400]
        //     )) // we can use a text style widget
    );
  }
}