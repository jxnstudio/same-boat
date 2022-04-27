import 'package:same_boat/src/data/data_access_service.dart';

import '../models/internal_user.sg.dart';

abstract class UserService {
  Future<void> updateUser(InternalUser user);
}

class UserServiceImpl implements UserService {
  static UserServiceImpl? _instance;

  final WriteService _writeService;
  UserServiceImpl._(this._writeService);

  factory UserServiceImpl(WriteService ws) {
    _instance ??= UserServiceImpl._(ws);
    return _instance!;
  }

  @override
  Future<void> updateUser(InternalUser user) async {
    return _writeService.updateUserData(user);
  }
}
