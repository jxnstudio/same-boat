import 'package:same_boat/src/data/data_update_manager.dart';
import 'package:same_boat/src/models/data/internal_user.sg.dart';

abstract class DataAccessType {}

abstract class DataAccessService {
  Future<void> createBoatForUser(String userId);

  Future<void> addUserToSearchQueue(String userId);

  Future<void> removeUserFromSearchQueue(String userId);

  Future<void> updateUserData(InternalUser user);

  Stream getBoatUpdateStream(String boatId);

  Stream getQueueUpdateStream(String userId);

  Stream<InternalUser> getActiveUserStream();

  static DataAccessService create(DataUpdateManager updateManager) {
    return _DataAccessServiceImpl(updateManager);
  }
}

class _DataAccessServiceImpl implements DataAccessService {
  final DataUpdateManager _updateManager;

  _DataAccessServiceImpl(this._updateManager);

  @override
  Future<void> addUserToSearchQueue(String userId) {
    throw Exception();
  }

  @override
  Future<void> createBoatForUser(String userId) {
    throw Exception();
  }

  @override
  Future<void> removeUserFromSearchQueue(String userId) {
    throw Exception();
  }

  @override
  Future<void> updateUserData(InternalUser user) {
    throw Exception();
  }

  @override
  Stream getBoatUpdateStream(String boatId) {
    throw Exception();
  }

  @override
  Stream getQueueUpdateStream(String userId) {
    throw Exception();
  }

  @override
  Stream<InternalUser> getActiveUserStream() async* {
    yield InternalUser(id: 'user123', userName: 'User', pfpId: 'pfp123');
  }
}

abstract class WriteService extends DataAccessType {
  Future<void> createBoatForUser(InternalUser user);

  Future<void> addUserToSearchQueue(String userId);

  Future<void> removeUserFromSearchQueue(String userId);

  Future<void> updateUserData(InternalUser user);
}

abstract class SubscribeService extends DataAccessType {
  Stream getBoatUpdateStream(String boatId);

  Stream getQueueUpdateStream(String userId);

  Stream<InternalUser> getActiveUserUpdateStream();
}

class WriteServiceImpl implements WriteService {
  final DataAccessService _dataAccessService;

  WriteServiceImpl(this._dataAccessService);

  @override
  Future<void> addUserToSearchQueue(String userId) {
    return _dataAccessService.addUserToSearchQueue(userId);
  }

  @override
  Future<void> createBoatForUser(InternalUser user) {
    return _dataAccessService.createBoatForUser(user.id);
  }

  @override
  Future<void> removeUserFromSearchQueue(String userId) {
    return _dataAccessService.removeUserFromSearchQueue(userId);
  }

  @override
  Future<void> updateUserData(InternalUser user) {
    return _dataAccessService.updateUserData(user);
  }
}

class SubscribeServiceImpl implements SubscribeService {
  final DataAccessService _dataAccessService;

  SubscribeServiceImpl(this._dataAccessService);

  @override
  Stream getBoatUpdateStream(String boatId) {
    return _dataAccessService.getBoatUpdateStream(boatId);
  }

  @override
  Stream getQueueUpdateStream(String userId) {
    return _dataAccessService.getQueueUpdateStream(userId);
  }

  @override
  Stream<InternalUser> getActiveUserUpdateStream() {
    return _dataAccessService.getActiveUserStream();
  }
}
