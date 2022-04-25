// import 'package:firebase_database/firebase_database.dart';
// import 'package:same_boat/src/models/internal_boat.sg.dart';
// import 'package:same_boat/src/models/json_record.dart';

// class BoatRecord extends JsonRecord<InternalBoat> {
//   static const String _idKey = 'boatId';
//   static const String _captainIdKey = 'captainId';
//   static const String _membersKey = 'members';
//   static const String _executedKey = 'executed';
//   static const String _result = 'result';

//   final Map<String, dynamic> _json;

//   BoatRecord(DatabaseReference reference, Map<String, dynamic> json)
//       : _json = json;

//   @override
//   Map<String, dynamic> get json => Map.unmodifiable(_json);

//   String get id => _json[_idKey];

//   String get captainId => _json[_captainIdKey]!;

//   Map<String, dynamic> get members => _json[_membersKey]!;

//   bool get executed => _json[_executedKey] ?? false;

//   bool get result => _json[_result] ?? false;
// }
