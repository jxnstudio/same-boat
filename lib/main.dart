import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'src/app/app.dart';
import 'src/app/service_manager.dart';

void main() {
  GetIt.I.registerSingleton<ServiceManager>(ServiceManager.create());
  runApp(const SameBoatApp());
}
