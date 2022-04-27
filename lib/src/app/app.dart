import 'package:flutter/material.dart';
import 'package:same_boat/src/ui/screens/home/home_screen.dart';

class SameBoatApp extends StatelessWidget {
  const SameBoatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(key: key),
    );
  }
}
