import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.purple[900]),
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter App')),
        body: Center(
          child: Text('Hello World')
        )
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