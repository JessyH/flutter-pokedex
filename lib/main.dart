import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Center(
        child: const Text('Init'),
      ),
    );
  }
}