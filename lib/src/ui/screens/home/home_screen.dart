import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:same_boat/src/providers/home_screen_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Widget _homeScreenBody(BuildContext context, HomeScreenProvider provider, _) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () => provider.createBoat('userId'),
          child: const Text('Create boat'),
        ),
        const Text('Todo: display shit'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => HomeScreenProvider(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Home')),
        body: Consumer<HomeScreenProvider>(
          builder: _homeScreenBody,
        ),
      ),
    );
  }
}
