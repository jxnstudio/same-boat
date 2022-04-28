import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:same_boat/src/services/data_access_service.dart';
import 'package:same_boat/src/data/data_update_manager.dart';

import 'src/app/app.dart';
import 'src/app/service_manager.dart';

void main() async {
  final updateManager = await DataUpdateManager.create();
  final dataAccessService = DataAccessService.create(updateManager);
  final serviceManager = ServiceManager.create(dataAccessService);
  ServiceManager.registerServices(GetIt.I, serviceManager);

  runApp(const SameBoatApp());
}
