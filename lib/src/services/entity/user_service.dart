import 'package:same_boat/src/services/data_access_service.dart';
import 'package:same_boat/src/models/data/internal_user.sg.dart';

abstract class UserService {
  Future<void> updateUser(InternalUser user);

  Stream<InternalUser> getActiveUserUpdateStream();
}

class UserServiceImpl implements UserService {
  static UserServiceImpl? _instance;

  final WriteService _writeService;
  final SubscribeService _subscribeService;

  factory UserServiceImpl(WriteService ws, SubscribeService ss) {
    _instance ??= UserServiceImpl._(ws, ss);
    return _instance!;
  }

  UserServiceImpl._(this._writeService, this._subscribeService);

  @override
  Future<void> updateUser(InternalUser user) async {
    return _writeService.updateUserData(user);
  }

  @override
  Stream<InternalUser> getActiveUserUpdateStream() {
    return _subscribeService.getActiveUserUpdateStream();
  }
}
