import 'package:firebase_database/firebase_database.dart';
import 'package:same_boat/src/data/records/db_record.dart';
import 'package:same_boat/src/models/internal_user.sg.dart';

class BoatRecord extends DbRecord<BoatRecordFields> {
  static final BoatRecordFields _fields = BoatRecordFields();

  factory BoatRecord.create(InternalUser boatCreator) {
    const newBoatId = 'newBoatId';

    final json = {
      BoatRecordFields.captainId: boatCreator.id,
      BoatRecordFields.members: {
        boatCreator.id: boatCreator.toMap(),
      },
    };

    return BoatRecord._(newBoatId, json);
  }

  BoatRecord._(String boatId, Map<JsonRecordField, dynamic> json)
      : super('/boat/$boatId', json: json);

  @override
  BoatRecordFields get fields => _fields;
}

class BoatRecordFields extends DbRecordFields {
  static const JsonRecordField captainId = JsonRecordField<String>(
    'captainId',
    isOptional: false,
  );

  static const JsonRecordField members = JsonRecordField<Map<String, dynamic>>(
    'members',
    isOptional: false,
  );

  static const JsonRecordField executed = JsonRecordField<bool>(
    'executed',
    isOptional: false,
  );

  static const JsonRecordField result = JsonRecordField<bool>(
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
