import 'package:get_it/get_it.dart';
import 'package:same_boat/src/models/data/internal_user.sg.dart';
import 'package:same_boat/src/services/entity/boat_service.dart';
import 'package:same_boat/src/services/entity/queue_service.dart';
import 'package:same_boat/src/services/entity/user_service.dart';

import './app_change_notifier.dart';

class HomeScreenStateModel extends AppChangeNotifier {
  late final BoatService _boatService;
  late final QueueService _queueService;
  late final UserService _userService;

  HomeScreenStateModel() : super() {
    _boatService = GetIt.I.get<BoatService>();
    _queueService = GetIt.I.get<QueueService>();
    _userService = GetIt.I.get<UserService>();
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
