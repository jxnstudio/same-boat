import 'package:firebase_database/firebase_database.dart';

class JsonRecordField<T> {
  final String name;
  final bool isOptional;

  const JsonRecordField(this.name, {this.isOptional = true});
}

abstract class DbRecordFields<T> {
  List<JsonRecordField> get fields;
}

abstract class DbRecord<T extends DbRecordFields> {
  final String referencePath;
  final Map<JsonRecordField, dynamic> json;

  V? getFieldValue<V>(JsonRecordField<V> field) {
    return json[field.name];
  }

  T get fields;

  DbRecord(this.referencePath, {required this.json});
}
