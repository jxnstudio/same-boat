import 'package:same_boat/src/data/db/schema/database_schema.dart';
import 'package:same_boat/src/data/records/db_record.dart';

class UserRecord extends DbRecord<UserRecordFields, DbUserSegment> {
  static Map<JsonRecordField, dynamic> _adapt(Map<String, dynamic> json) => {
        for (final field in UserRecordFields().fields) field: json[field.key],
      };

  factory UserRecord.fromBoat(
    String boatId,
    String userId,
    Map<String, dynamic> json,
  ) =>
      UserRecord._(
        DbSchema.boat(boatId).member(userId),
        json: _adapt(json),
      );

  factory UserRecord.user(
    String userId,
    Map<String, dynamic> json,
  ) =>
      UserRecord._(
        DbSchema.user(userId),
        json: _adapt(json),
      );

  factory UserRecord.from({
    required String userId,
    required String username,
    required String pfpId,
    String? boatId,
  }) {
    final json = {
      UserRecordFields.username.key: username,
      UserRecordFields.pfpId.key: pfpId,
    };

    if (boatId != null) {
      return UserRecord.fromBoat(boatId, userId, json);
    }

    return UserRecord.user(userId, json);
  }

  UserRecord._(super.referencePath, {required super.json});

  @override
  UserRecordFields get fields => UserRecordFields();
}

class UserRecordFields extends DbRecordFields {
  static const JsonRecordField<String> username = JsonRecordField(
    'username',
    isOptional: false,
  );

  static const JsonRecordField<String> pfpId = JsonRecordField('pfpId');

  @override
  List<JsonRecordField> get fields => const [
        username,
        pfpId,
      ];
}
