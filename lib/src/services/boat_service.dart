import 'package:same_boat/src/data/data_access_service.dart';

abstract class BoatService {
  Future<void> createBoat(String userId);

  Stream subscribeToBoat(String boatId);
}

class BoatServiceImpl implements BoatService {
  final WriteService _writeService;
  final SubscribeService _subscribeService;

  BoatServiceImpl(this._writeService, this._subscribeService);

  @override
  Future<void> createBoat(String userId) {
    return _writeService.createBoatForUser(userId);
  }

  @override
  Stream subscribeToBoat(String boatId) {
    return _subscribeService.getBoatUpdateStream(boatId);
  }
}
