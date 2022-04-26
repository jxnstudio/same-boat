import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:same_boat/src/providers/home_screen_provider.dart';
import 'package:same_boat/src/ui/screens/home/home_screen.dart';

class SameBoatApp extends StatelessWidget {
  const SameBoatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => HomeScreenProvider(),
        ),
      ],
      child: MaterialApp(
        home: HomeScreen(key: key),
      ),
    );
  }
}
