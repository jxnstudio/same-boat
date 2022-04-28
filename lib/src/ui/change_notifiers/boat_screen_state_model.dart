import 'package:get_it/get_it.dart';
import 'package:same_boat/src/app/service_manager.dart';
import 'package:same_boat/src/models/data/internal_user.sg.dart';
import 'package:same_boat/src/services/entity/boat_service.dart';
import 'package:same_boat/src/services/entity/queue_service.dart';

import './app_change_notifier.dart';

class BoatScreenProvider extends AppChangeNotifier {
  late BoatService _boatService;
  late QueueService _queueService;

  Future<void> joinBoatQueue({required InternalUser user}) {
    return _queueService.addUserToQueue(user);
  }

  void _onBoatDataUpdate(dynamic data) {
    notifyListeners();
  }

  BoatScreenProvider(String boatId) : super() {
    final serviceManager = GetIt.I.get<ServiceManager>();

    _boatService = serviceManager.boatService;
    _queueService = serviceManager.queueService;

    manageStreamSubscription(_boatService
        .subscribeToBoat(boatId)
        .map((streamData) => streamData)
        .listen(_onBoatDataUpdate));
  }
}
