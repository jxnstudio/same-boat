import 'package:get_it/get_it.dart';
import 'package:same_boat/src/data/data_access_service.dart';

abstract class BoatService {
  Future<void> createBoat(String userId);

  Stream subscribeToBoat(String boatId);
}

class BoatServiceImpl implements BoatService {
  static BoatServiceImpl? _instance;

  final WriteService _writeService;
  final SubscribeService _subscribeService;

  BoatServiceImpl._(this._writeService, this._subscribeService);

  factory BoatServiceImpl(WriteService ws, SubscribeService ss) {
    _instance ??= BoatServiceImpl._(ws, ss);
    return _instance!;
  }

  @override
  Future<void> createBoat(String userId) {
    return _writeService.createBoatForUser(userId);
  }

  @override
  Stream subscribeToBoat(String boatId) {
    return _subscribeService.getBoatUpdateStream(boatId);
  }
}
