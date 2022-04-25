import 'package:same_boat/src/data/data_access_service.dart';

import '../models/internal_user.sg.dart';

abstract class UserService {
  Future<void> updateUser(InternalUser user);
}

class UserServiceImpl implements UserService {
  final WriteService _dataService;
  UserServiceImpl(this._dataService);

  @override
  Future<void> updateUser(InternalUser user) async {
    return _dataService.updateUserData(user);
  }
}
