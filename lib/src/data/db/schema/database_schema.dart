class DbSchema {
  static const DbRootSegment _root = DbRootSegment();
  static DbBoatSegment boat(String boatId) =>
      DbBoatSegment(boatId, DbSchema._root);
}

class DbRootSegment extends SchemaPathSegment {
  const DbRootSegment() : super.root();
}

class DbBoatSegment extends SchemaPathSegment {
  DbBoatSegment(String boatId, SchemaPathSegment prev)
      : super('boat/', prev, boatId);
}

class DbBoatMembersSegment extends SchemaPathSegment {
  DbBoatMembersSegment(DbBoatSegment boatRecord, [String? memberId])
      : super('members/', boatRecord, memberId);
}

class DbUserSegment extends SchemaPathSegment {
  DbUserSegment(String userId) : super('users/$userId');
}

abstract class SchemaPathSegment {
  final String label;

  final String? identifier;
  final SchemaPathSegment? previous;

  String getString() => '$label/${identifier == null ? '' : '$identifier/'}';

  const SchemaPathSegment.root()
      : label = '',
        identifier = null,
        previous = null;

  const SchemaPathSegment(this.label, [this.previous, this.identifier]);
}
