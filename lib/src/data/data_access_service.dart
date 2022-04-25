import 'package:same_boat/src/models/internal_user.sg.dart';

abstract class DataAccessType {}

abstract class DataAccessService {
  Future<void> createBoatForUser(String userId);

  Future<void> addUserToSearchQueue(String userId);

  Future<void> removeUserFromSearchQueue(String userId);

  Future<void> updateUserData(InternalUser user);

  Stream getBoatUpdateStream(String boatId);

  Stream getQueueUpdateStream(String userId);

  static DataAccessService create() {
    return _DataAccessServiceImpl();
  }
}

class _DataAccessServiceImpl implements DataAccessService {
  _DataAccessServiceImpl();

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
}

abstract class WriteService extends DataAccessType {
  Future<void> createBoatForUser(String userId);

  Future<void> addUserToSearchQueue(String userId);

  Future<void> removeUserFromSearchQueue(String userId);

  Future<void> updateUserData(InternalUser user);
}

abstract class SubscribeService extends DataAccessType {
  Stream getBoatUpdateStream(String boatId);

  Stream getQueueUpdateStream(String userId);
}

class WriteServiceImpl implements WriteService {
  final DataAccessService _dataAccessService;

  WriteServiceImpl(this._dataAccessService);

  @override
  Future<void> addUserToSearchQueue(String userId) {
    return _dataAccessService.addUserToSearchQueue(userId);
  }

  @override
  Future<void> createBoatForUser(String userId) {
    return _dataAccessService.createBoatForUser(userId);
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
}
