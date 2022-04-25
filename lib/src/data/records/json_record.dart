typedef JsonFactory<T> = T Function(Map<String, dynamic>);

enum JsonValueType {
  nullType,
  booleanType,
  integerType,
  floatType,
  stringType,
  objectType,
}

class JsonRecordField {
  final String name;
  final JsonValueType type;

  const JsonRecordField(this.name, this.type);
}

/// Represents a JSON object for a database node of a given type
abstract class JsonRecord {
  final Map<String, dynamic> _json;
  Map<String, dynamic> get json => Map.unmodifiable(_json);

  List<JsonRecordField> get fields;

  JsonRecord(this._json);
}
