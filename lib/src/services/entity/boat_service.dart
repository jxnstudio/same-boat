import 'package:same_boat/src/services/data_access_service.dart';
import 'package:same_boat/src/models/data/internal_user.sg.dart';

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
    return _writeService.createBoatForUser(InternalUser(
      id: userId,
      userName: 'Funny Username',
      pfpId: 'defaultPfp',
    ));
  }

  @override
  Stream subscribeToBoat(String boatId) {
    return _subscribeService.getBoatUpdateStream(boatId);
  }
}
