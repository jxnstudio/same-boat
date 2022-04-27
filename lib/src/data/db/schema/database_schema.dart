class DbSchema {
  static const DbRootSegment _root = DbRootSegment();
  static DbBoatSegment boat(String boatId) => _root.boat(boatId);
  static DbUserSegment user(String userId) => _root.user(userId);
}

class DbRootSegment extends SchemaPathSegment {
  const DbRootSegment() : super.root();

  DbBoatSegment boat(String boatId) => DbBoatSegment(boatId);
  DbUserSegment user(String userId) => DbUserSegment(userId);
}

class DbBoatSegment extends SchemaPathSegment {
  late final DbBoatMembersSegment _members;

  DbBoatMembersSegment get members => _members;

  DbBoatSegment(String boatId) : super('boat/', DbSchema._root, boatId) {
    _members = DbBoatMembersSegment(this);
  }

  DbBoatMembersSegment member(String memberId) {
    return DbBoatMembersSegment(this, memberId);
  }
}

class DbBoatMembersSegment extends SchemaPathSegment {
  DbBoatMembersSegment(DbBoatSegment boatRecord, [String? memberId])
      : super('members/', boatRecord, memberId);
}

class DbUserSegment extends SchemaPathSegment {
  DbUserSegment(String userId)
      : super(
          'users',
          DbSchema._root,
        );
}

abstract class SchemaPathSegment {
  final String label;

  final String? identifier;
  final SchemaPathSegment? previous;

  String getString() => '$label/${identifier == null ? '' : '$identifier/'}';

  Iterable<SchemaPathSegment> _parentChain() sync* {
    SchemaPathSegment? current = this;

    while (current != null) {
      yield current;
      current = current.previous;
    }
  }

  String getPathToSegment() {
    final parentChain = _parentChain().toList();

    return parentChain.reversed.map((segment) => segment.getString()).join();
  }

  const SchemaPathSegment.root()
      : label = '',
        identifier = null,
        previous = null;

  const SchemaPathSegment(this.label, [this.previous, this.identifier]);
}
