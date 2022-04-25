import 'dart:async';

import 'package:flutter/foundation.dart';

class AppChangeNotifier implements ChangeNotifier {
  final ChangeNotifier _changeNotifier;

  AppChangeNotifier(this._changeNotifier);

  final Set<StreamSubscription> _managedSubscriptions = {};

  @override
  void addListener(VoidCallback listener) =>
      _changeNotifier.addListener(listener);

  @override
  void dispose() {
    for (final sub in _managedSubscriptions) {
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
    _managedSubscriptions.add(sub);
  }

  void removeFromManaged(StreamSubscription sub) {
    _managedSubscriptions.remove(sub);
  }
}
