import 'package:same_boat/src/services/boat_service.dart';
import 'package:same_boat/src/services/boat_service_impl.dart';
import 'package:same_boat/src/services/data_service.dart';
import 'package:get_it/get_it.dart';

import 'boat_service.dart';
import 'data_service_impl.dart';

class ServiceManager {
  late final BoatService _boatService;

  BoatService get boatService => _boatService;

  static void initRealServices() {
    DataService dataService = DataServiceImpl();
    BoatService boatService = BoatServiceImpl(dataService);
    GetIt.I.registerSingleton(boatService);
  }

  ServiceManager() {
    _boatService = GetIt.I.get<BoatService>();
  }
}
