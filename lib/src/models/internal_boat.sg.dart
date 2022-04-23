import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';

import 'internal_user.sg.dart';

part 'internal_boat.sg.g.dart';

abstract class InternalBoat
    implements Built<InternalBoat, InternalBoatBuilder> {
  BuiltList<InternalUser> get boatMembers;
  String get captainId;

  InternalBoat._();
  factory InternalBoat({
    required String captainId,
    required List<InternalUser> boatMembers,
  }) =>
      _$InternalBoat(
        (InternalBoatBuilder b) => b
          ..boatMembers = ListBuilder(boatMembers)
          ..captainId = captainId,
      );
}
