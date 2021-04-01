import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        children: [
          // Card(
          //   color: Colors.blue,
          //   child: Container(
          //     width: double.infinity,
          //     child: Text('CHART!'),
          //   ),
          //   elevation: 5,
          // ),
          // Can do it both ways
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text('List of Tx!'),
            ),
          ),
          Card(
            child: Text('List of Tx!'),
          ),
        ],
      ),
    );
  }
}
