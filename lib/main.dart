import 'package:flutter/material.dart';
import 'package:same_boat/src/models/internal_boat.sg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Example')),
        body: const Center(
          child: Text("Beep Boop"),
        ),
      ),
    );
  }
}
