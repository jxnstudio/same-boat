import 'package:firebase_database/firebase_database.dart';
import 'package:same_boat/src/data/db/schema/database_schema.dart';

class FirebaseRealtimeDatabase {
  static FirebaseRealtimeDatabase? _instance;

  static FirebaseRealtimeDatabase create() {
    if (_instance != null) return _instance!;

    _instance = FirebaseRealtimeDatabase._(FirebaseDatabase.instance);

    return _instance!;
  }

  final FirebaseDatabase _database;

  FirebaseRealtimeDatabase._(this._database);

  DatabaseReference newRef([String? path]) => _database.ref(path);

  Future<void> doSet(SchemaPathSegment segment, Map<String, dynamic> json) {
    return newRef(segment.getPathToSegment()).set(json);
  }

  Future<void> doUpdate(SchemaPathSegment segment, Map<String, dynamic> json) {
    return newRef(segment.getPathToSegment()).update({"": json});
  }

  Future<void> clearAtPath(SchemaPathSegment segment) {
    return newRef(segment.getPathToSegment()).set(null);
  }
}
