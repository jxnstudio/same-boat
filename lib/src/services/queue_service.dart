import 'package:same_boat/src/data/data_access_service.dart';

import '../models/internal_user.sg.dart';

abstract class QueueService {
  Future<void> addUserToQueue(InternalUser user);

  Future<void> dequeueUser(InternalUser user);
}

class QueueServiceImpl implements QueueService {
  static QueueServiceImpl? _instance;

  final WriteService _writeService;

  QueueServiceImpl._(this._writeService);

  factory QueueServiceImpl(WriteService ws) {
    _instance ??= QueueServiceImpl._(ws);
    return _instance!;
  }

  @override
  Future<void> addUserToQueue(InternalUser user) {
    return _writeService.addUserToSearchQueue(user.id);
  }

  @override
  Future<void> dequeueUser(InternalUser user) {
    return _writeService.removeUserFromSearchQueue(user.id);
  }
}
