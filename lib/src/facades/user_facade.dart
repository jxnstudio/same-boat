import 'package:same_boat/src/models/json/records/user_record.dart';
import 'package:same_boat/src/models/json_record.dart';

import '../models/internal_user.sg.dart';

class UserFacade {
  factory UserFacade.create(
    dynamic updateManager,
    JsonRecord<InternalUser> user,
  ) {
    return UserFacade._(user);
  }

  factory UserFacade.fromJsonRecord(JsonRecord<InternalUser> record) =
      UserFacade._;

  final UserRecord _user;
  UserFacade._(JsonRecord<InternalUser> record) : _user = UserRecord(record);

  InternalUser toInternal() {
    return InternalUser(userName: _user.username, pfpId: _user.pfpId);
  }
}
