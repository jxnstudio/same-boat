import 'package:same_boat/src/facades/user_facade.dart';
import 'package:same_boat/src/models/json/records/boat_record.dart';
import 'package:same_boat/src/models/json_record.dart';

import '../models/internal_boat.sg.dart';

class BoatFacade {
  factory BoatFacade.create(
    dynamic updateManager,
    JsonRecord<InternalBoat> boat,
  ) {
    return BoatFacade._(boat);
  }

  factory BoatFacade.fromJsonRecord(
    JsonRecord<InternalBoat> boat,
  ) {
    return BoatFacade._(boat);
  }

  final BoatRecord _boat;
  final List<UserFacade> _members = [];

  BoatFacade._(JsonRecord<InternalBoat> record) : _boat = BoatRecord(record) {
    for (final memberJson in _boat.members.values) {
      _members.add(UserFacade.fromJsonRecord(memberJson));
    }
  }

  InternalBoat toInternal() {
    return InternalBoat(
      captainId: _boat.captainId,
      boatMembers: _members.map((user) => user.toInternal()).toList(),
    );
  }
}
