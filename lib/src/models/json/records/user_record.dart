import 'package:same_boat/src/models/internal_user.sg.dart';
import 'package:same_boat/src/models/json_record.dart';

class UserRecord implements JsonRecord<InternalUser> {
  static const String _idKey = 'userId';
  static const String _usernameKey = 'username';
  static const String _pfpIdKey = 'pfpId';

  final Map<String, dynamic> _json;

  UserRecord(JsonRecord<InternalUser> jsonRecord) : _json = jsonRecord.json;

  @override
  Map<String, dynamic> get json => Map.unmodifiable(_json);

  String get id => _json[_idKey]!;

  String get username => _json[_usernameKey]!;

  String get pfpId => _json[_pfpIdKey];
}
