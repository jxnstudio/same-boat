import 'dart:async';

import 'package:flutter/foundation.dart';

class AppChangeNotifier implements ChangeNotifier {
  final ChangeNotifier _changeNotifier = ChangeNotifier();

  AppChangeNotifier();

  final Set<StreamSubscription> _managedStreamSubscriptions = {};

  @override
  void addListener(VoidCallback listener) =>
      _changeNotifier.addListener(listener);

  @override
  void dispose() {
    for (final sub in _managedStreamSubscriptions) {
      sub.cancel();
    }

    _changeNotifier.dispose();
  }

  @override
  bool get hasListeners => _changeNotifier.hasListeners;

  @override
  void notifyListeners() => _changeNotifier.notifyListeners();

  @override
  void removeListener(VoidCallback listener) =>
      _changeNotifier.removeListener(listener);

  void manageStreamSubscription(StreamSubscription sub) {
    _managedStreamSubscriptions.add(sub);
  }

  void removeFromManaged(StreamSubscription sub) {
    _managedStreamSubscriptions.remove(sub);
  }
}
