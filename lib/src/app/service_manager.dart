import 'package:get_it/get_it.dart';
import 'package:same_boat/src/services/data_access_service.dart';
import 'package:same_boat/src/services/entity/boat_service.dart';
import 'package:same_boat/src/services/entity/queue_service.dart';
import 'package:same_boat/src/services/entity/user_service.dart';

/// Manages the lifecycle for the services layer of the app.
///
/// The services layer roughly looks like this:
///
/// DataAccessService <--> (WriteService + SubscriptionService) <-->
/// Domain Services
class ServiceManager {
  static ServiceManager? _instance;
  final BoatService _boatService;
  final QueueService _queueService;
  final UserService _userService;

  BoatService get boatService => _boatService;
  QueueService get queueService => _queueService;
  UserService get userService => _userService;

  static void registerServices(GetIt serviceLocator, ServiceManager manager) {
    serviceLocator.registerSingleton<BoatService>(manager.boatService);
    serviceLocator.registerSingleton<QueueService>(manager.queueService);
    serviceLocator.registerSingleton<UserService>(manager.userService);
  }

  static ServiceManager create(DataAccessService dataAccessService) {
    if (_instance != null) return _instance!;

    // Contain the business logic of the service layer
    WriteService writeService = WriteServiceImpl(dataAccessService);
    SubscribeService subscribeService = SubscribeServiceImpl(dataAccessService);

    // Domain sub-layer of service layer: each of these provide a scoped view
    // into the service layer business logic,
    BoatService boatService = BoatServiceImpl(writeService, subscribeService);
    QueueService queueService = QueueServiceImpl(writeService);
    UserService userService = UserServiceImpl(writeService, subscribeService);

    _instance = ServiceManager._(
      boatService,
      queueService,
      userService,
    );

    return _instance!;
  }

  ServiceManager._(
    this._boatService,
    this._queueService,
    this._userService,
  );
}
