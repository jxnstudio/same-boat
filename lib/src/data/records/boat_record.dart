import 'package:same_boat/src/data/db/schema/database_schema.dart';
import 'package:same_boat/src/data/records/db_record.dart';
import 'package:same_boat/src/models/internal_user.sg.dart';

class BoatRecord extends DbRecord<BoatRecordFields, DbBoatSegment> {
  static final BoatRecordFields _fields = BoatRecordFields();

  factory BoatRecord.forNewBoat(String boatId, InternalUser creator) {
    final json = {
      BoatRecordFields.captainId: creator.id,
      BoatRecordFields.members: {
        creator.id: creator.toMap(),
      },
      BoatRecordFields.executed: false,
      BoatRecordFields.result: false,
    };

    return BoatRecord._(boatId, json);
  }

  factory BoatRecord.fromJson(String boatId, Map<String, dynamic> boatJson) {
    final json = {
      for (final field in BoatRecordFields().fields) field: boatJson[field.key],
    };

    return BoatRecord._(boatId, json);
  }

  BoatRecord._(String boatId, Map<JsonRecordField, dynamic> json)
      : super(DbSchema.boat(boatId), json: json);

  @override
  BoatRecordFields get fields => _fields;
}

class BoatRecordFields extends DbRecordFields {
  static const JsonRecordField<String> captainId = JsonRecordField(
    'captainId',
    isOptional: false,
  );

  static const JsonRecordField<Map<String, dynamic>> members = JsonRecordField(
    'members',
    isOptional: false,
  );

  static const JsonRecordField<bool> executed = JsonRecordField(
    'executed',
    isOptional: false,
  );

  static const JsonRecordField<bool> result = JsonRecordField(
    'result',
    isOptional: false,
  );

  @override
  List<JsonRecordField> get fields => const [
        captainId,
        members,
        executed,
        result,
      ];
}
