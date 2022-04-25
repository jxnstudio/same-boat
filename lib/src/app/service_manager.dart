import 'package:same_boat/src/data/data_access_service.dart';
import 'package:same_boat/src/services/boat_service.dart';
import 'package:same_boat/src/services/queue_service.dart';
import 'package:same_boat/src/services/user_service.dart';

class ServiceManager {
  final BoatService _boatService;
  final QueueService _queueService;
  final UserService _userService;

  BoatService get boatService => _boatService;
  QueueService get queueService => _queueService;
  UserService get userService => _userService;

  static ServiceManager create() {
    DataAccessService dataAccessService = DataAccessService.create();

    WriteService writeService = WriteServiceImpl(dataAccessService);
    SubscribeService subscribeService = SubscribeServiceImpl(dataAccessService);

    BoatService boatService = BoatServiceImpl(writeService, subscribeService);
    QueueService queueService = QueueServiceImpl(writeService);
    UserService userService = UserServiceImpl(writeService);

    final serviceManager = ServiceManager._(
      boatService,
      queueService,
      userService,
    );

    return serviceManager;
  }

  ServiceManager._(
    this._boatService,
    this._queueService,
    this._userService,
  );
}
