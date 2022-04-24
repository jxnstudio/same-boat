import 'package:same_boat/src/models/internal_boat.sg.dart';
import 'package:same_boat/src/services/boat_service.dart';
import 'package:same_boat/src/services/data_service.dart';

class BoatServiceImpl implements BoatService {
  final DataService _dataService;

  BoatServiceImpl(this._dataService);

  @override
  Stream createBoat() {
    return _dataService.createBoat();
  }

  @override
  Stream subscribeToBoat(String boatId) {
    return _dataService.subscribeToBoat(boatId);
  }
}
