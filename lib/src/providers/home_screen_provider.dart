import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:same_boat/src/models/internal_user.sg.dart';
import 'package:same_boat/src/providers/app_change_notifier.dart';
import 'package:same_boat/src/services/boat_service.dart';
import 'package:same_boat/src/services/queue_service.dart';
import 'package:same_boat/src/services/user_service.dart';

import '../app/service_manager.dart';

class HomeScreenProvider extends AppChangeNotifier {
  late final BoatService _boatService;
  late final QueueService _queueService;
  late final UserService _userService;

  HomeScreenProvider() : super(ChangeNotifier()) {
    final serviceManager = GetIt.I.get<ServiceManager>();
    _boatService = serviceManager.boatService;
    _queueService = serviceManager.queueService;
    _userService = serviceManager.userService;
  }

  Future<void> createBoat(String userId) {
    return _boatService.createBoat(userId);
  }

  Future<void> joinBoatQueue(InternalUser user) {
    return _queueService.addUserToQueue(user);
  }

  Future<void> udpateUser(InternalUser user) {
    return _userService.updateUser(user);
  }
}
