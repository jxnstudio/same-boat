import 'package:same_boat/src/data/records/db_record.dart';

class UserRecord extends DbRecord<UserRecordFields> {
  @override
  // TODO: implement fields
  get fields => throw UnimplementedError();
}

class UserRecordFields extends DbRecordFields {
  static const JsonRecordField<String> username =
      JsonRecordField('username', isOptional: false);
  static const JsonRecordField<String> pfpId = JsonRecordField('pfpId');

  @override
  List<JsonRecordField> get fields => const [
        username,
        pfpId,
      ];
}
