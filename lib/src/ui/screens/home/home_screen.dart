import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:same_boat/src/ui/change_notifiers/home_screen_state_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Widget _homeScreenBody(
      BuildContext context, HomeScreenStateModel provider, _) {
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
      create: (_) => HomeScreenStateModel(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Home')),
        body: Consumer<HomeScreenStateModel>(
          builder: _homeScreenBody,
        ),
      ),
    );
  }
}
