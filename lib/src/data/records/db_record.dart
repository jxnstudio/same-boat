import 'package:firebase_database/firebase_database.dart';
import 'package:same_boat/src/data/db/schema/database_schema.dart';

class JsonRecordField<T> {
  final String key;
  final bool isOptional;

  const JsonRecordField(this.key, {this.isOptional = true});
}

abstract class DbRecordFields<T> {
  List<JsonRecordField> get fields;
}

abstract class DbRecord<T extends DbRecordFields, S extends SchemaPathSegment> {
  final SchemaPathSegment referencePath;
  final Map<JsonRecordField, dynamic> json;

  V? getFieldValue<V>(JsonRecordField<V> field) {
    return json[field.key];
  }

  T get fields;

  DbRecord(this.referencePath, {required this.json});
}
