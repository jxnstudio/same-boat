import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:same_boat/src/app/service_manager.dart';
import 'package:same_boat/src/models/internal_user.sg.dart';
import 'package:same_boat/src/providers/app_change_notifier.dart';
import 'package:same_boat/src/services/boat_service.dart';
import 'package:same_boat/src/services/queue_service.dart';

import '../models/ui/boat_data.dart';

class BoatScreenProvider extends AppChangeNotifier {
  late BoatService _boatService;
  late QueueService _queueService;

  Future<void> joinBoatQueue({required InternalUser user}) {
    return _queueService.addUserToQueue(user);
  }

  void _onBoatDataUpdate(BoatData boatData) {
    notifyListeners();
  }

  BoatScreenProvider(String boatId) : super(ChangeNotifier()) {
    final serviceManager = GetIt.I.get<ServiceManager>();

    _boatService = serviceManager.boatService;
    _queueService = serviceManager.queueService;

    manageStreamSubscription(_boatService
        .subscribeToBoat(boatId)
        .map((streamData) => BoatData())
        .listen(_onBoatDataUpdate));
  }
}
